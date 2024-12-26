#!/bin/bash

# 设置颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 打印信息函数
print_message() {
    echo -e "${GREEN}==>${NC} $1"
}

# 检查命令是否存在
check_command() {
    command -v $1 &> /dev/null
}

# 安装 Homebrew
install_homebrew() {
    if ! check_command "brew"; then
        print_message "正在安装 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        if [[ $(uname -m) == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi
}

# 安装工具的函数
install_tool() {
    if [[ "$AUTO_INSTALL" == "y" ]]; then
        print_message "正在安装 $1..."
        brew install $2
        print_message "$1 安装完成！"
    else
        read -p "是否安装 $1? (y/n): " choice
        if [[ "$choice" == "y" ]]; then
            print_message "正在安装 $1..."
            brew install $2
            print_message "$1 安装完成！"
        else
            print_message "$1 安装被跳过。"
        fi
    fi
}

# 安装 LazyVim
install_lazyvim() {
    print_message "备份当前的 Neovim 配置..."
    mv ~/.config/nvim{,.bak}
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}

    print_message "克隆 LazyVim 启动模板..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim

    print_message "移除 .git 文件夹..."
    rm -rf ~/.config/nvim/.git

    print_message "LazyVim 安装完成！"
}

# 主安装函数
main() {
    print_message "开始安装过程..."
    
    # 询问是否一键安装所有工具
    read -p "是否一键安装所有工具? (y/n): " AUTO_INSTALL
    export AUTO_INSTALL
    
    install_homebrew

    # 安装和更新 Homebrew
    print_message "安装和更新 Homebrew 包管理器..."
    brew update

    # 安装基础 shell 环境
    print_message "安装基础 shell 环境..."
    install_tool "zsh" ""
    install_tool "git" ""
    install_tool "tmux" ""
    install_tool "lua" ""
    install_tool "Wezterm" "--cask wezterm"

    # 安装命令行增强工具
    print_message "安装命令行增强工具..."
    install_tool "eza" ""
    install_tool "tree" ""
    install_tool "fd" ""
    install_tool "fzf" ""
    install_tool "zoxide" ""
    install_tool "bat" ""
    install_tool "tldr" ""

    # 安装字体和主题
    print_message "安装字体和主题..."
    brew tap homebrew/cask-fonts
    install_tool "Nerd Font" "--cask font-hack-nerd-font"
    print_message "安装 zsh 插件..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # 安装开发工具和配置
    print_message "安装开发工具和配置..."
    install_lazyvim
    if [[ ! -d ~/.oh-my-zsh ]]; then
        print_message "安装 Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    install_tool "Cursor" "--cask cursor"

    # 安装基础系统工具
    print_message "安装基础系统工具..."
    install_tool "Karabiner-Elements" "--cask karabiner-elements"
    install_tool "Raycast" "--cask raycast"
    install_tool "Aerospace" "--cask aerospace"
    install_tool "Loop" "--cask loop"

    print_message "所有工具安装完成！"
}

main