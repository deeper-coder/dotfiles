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
    local total_steps=8
    local current_step=1
    
    # 步骤 1: 安装和更新 Homebrew
    print_message "[${current_step}/${total_steps}] 安装和更新 Homebrew 包管理器..."
    install_homebrew
    brew update
    ((current_step++))

    # 步骤 2: 安装网络相关工具
    print_message "[${current_step}/${total_steps}] 安装网络相关工具..."
    print_message "正在安装网络代理工具 xray (1/2)..."
    brew install xray
    print_message "正在安装网络测试工具 iperf3 (2/2)..."
    brew install iperf3
    ((current_step++))

    # 步骤 3: 安装基础系统工具
    print_message "[${current_step}/${total_steps}] 安装基础系统工具..."
    print_message "正在安装系统改键工具 Karabiner-Elements (1/3)..."
    brew install --cask karabiner-elements
    print_message "正在安装系统启动器 Raycast (2/3)..."
    brew install --cask raycast
    print_message "正在安装系统分屏工具 Loop (3/3)..."
    brew install --cask loop
    ((current_step++))

    # 步骤 4: 安装基础 shell 环境
    print_message "[${current_step}/${total_steps}] 安装基础 shell 环境..."
    print_message "正在安装 zsh (1/4)..."
    brew install zsh
    print_message "正在安装 tmux 终端复用器 (2/4)..."
    brew install tmux
    print_message "正在安装 lua 解释器 (3/4)..."
    brew install lua
    print_message "正在安装终端模拟器 Wezterm (4/4)..."
    brew install --cask wezterm
    ((current_step++))

    # 步骤 5: 安装开发工具和配置
    print_message "[${current_step}/${total_steps}] 安装开发工具和配置..."
    install_lazyvim
    if [[ ! -d ~/.oh-my-zsh ]]; then
        print_message "安装 Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    ((current_step++))

    # 步骤 6: 安装命令行增强工具
    print_message "[${current_step}/${total_steps}] 安装命令行增强工具..."
    print_message "正在安装文件管理工具 eza (1/8)..."
    brew install eza
    print_message "正在安装文件树查看工具 tree (2/8)..."
    brew install tree
    print_message "正在安装文件查找工具 fd (3/8)..."
    brew install fd
    print_message "正在安装模糊查找工具 fzf (4/8)..."
    brew install fzf
    print_message "正在安装目录跳转工具 zoxide (5/8)..."
    brew install zoxide
    print_message "正在安装文本查看增强工具 bat (6/8)..."
    brew install bat
    print_message "正在安装文档工具 tldr (7/8)..."
    brew install tldr
    print_message "正在安装窗口管理工具 Aerospace (8/8)..."
    brew install --cask aerospace
    ((current_step++))

    # 步骤 7: 安装字体和主题
    print_message "[${current_step}/${total_steps}] 安装字体和主题..."
    print_message "正在安装 Nerd Font..."
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    print_message "安装 zsh 插件..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ((current_step++))

    # 步骤 8: 安装其他应用和工具
    print_message "[${current_step}/${total_steps}] 安装其他应用和工具..."
    print_message "正在安装文档工具 (Skim, QLMarkdown, Syntax-Highlight) (1/3)..."
    brew install --cask skim
    brew install --cask qlmarkdown
    brew install --cask syntax-highlight
    print_message "正在安装歌词工具 LyricsX (2/3)..."
    brew tap brewforge/extras
    brew install brewforge/extras/lyricsx-mxiris
    print_message "正在安装解压缩工具 Keka (3/3)..."
    brew install --cask keka
    print_message "正在安装浏览器 Zen (4/5)..."
    brew install --cask zen-browser
    print_message "正在安装笔记应用 Notion (5/5)..."
    brew install --cask notion

    print_message "所有软件安装完成！"
    print_message "请运行 ./setup_configs.sh 来设置配置文件"
}

main