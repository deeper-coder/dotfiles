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

# 主安装函数
main() {
    print_message "开始安装过程..."
    
    # 安装和更新 Homebrew
    install_homebrew
    print_message "更新 Homebrew..."
    brew update

    # 安装命令行工具
    print_message "安装命令行工具..."
    brew install xray
    brew install zsh
    brew install tmux
    brew install neovim
    brew install tldr
    brew install eza
    brew install fzf
    brew install zoxide

    # 安装 Oh My Zsh
    if [[ ! -d ~/.oh-my-zsh ]]; then
        print_message "安装 Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    # 安装字体
    print_message "安装 Nerd Fonts..."
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font

    # 安装 zsh 插件
    print_message "安装 zsh 插件..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # 安装 GUI 应用
    print_message "安装应用软件..."
    brew install --cask karabiner-elements

    print_message "所有软件安装完成！"
    print_message "请运行 ./setup_configs.sh 来设置配置文件"
}

main