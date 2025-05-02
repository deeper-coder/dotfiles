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
    
    # 安装 Homebrew 包管理器
    install_homebrew
    print_message "安装和更新 Homebrew 包管理器..."
    # brew update

    # ===== 核心命令行工具 =====
    print_message "安装核心命令行工具..."
    # 基础 shell 环境
    install_tool "git" "git"         # 版本控制系统
    install_tool "tmux" "tmux"       # 终端复用器
    install_tool "lua" "lua"         # 脚本语言，许多工具的依赖

    # ===== ZSH 相关工具 =====
    print_message "安装 ZSH 相关工具..."
    install_tool "zsh" "zsh"         # 强大的 shell 环境
    
    # Oh My Zsh
    if [[ ! -d ~/.oh-my-zsh ]]; then
        print_message "安装 Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    
    # ZSH 插件
    print_message "安装 zsh 插件..."
    # 自动补全和语法高亮
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # ===== 命令行增强工具 =====
    print_message "安装命令行增强工具..."
    # 文件浏览和搜索
    install_tool "eza" "eza"         # ls 的现代替代品
    install_tool "tree" "tree"       # 目录结构可视化
    install_tool "fd" "fd"           # find 的现代替代品
    install_tool "fzf" "fzf"         # 模糊查找器
    install_tool "yazi" "yazi"       # 终端文件管理器
    
    # 导航和效率工具
    install_tool "zoxide" "zoxide"   # 智能目录跳转
    install_tool "bat" "bat"         # cat 的现代替代品
    install_tool "tlrc" "tlrc"       # 终端命令记录器
    
    # 系统监控
    install_tool "bpytop" "bpytop"   # 资源监控工具
    
    # ===== 字体和主题 =====
    print_message "安装字体和主题..."
    brew tap homebrew/cask-fonts
    install_tool "Hack Nerd Font" "--cask font-hack-nerd-font"           # 编程字体，支持图标
    install_tool "JetBrains Mono Nerd Font" "--cask font-jetbrains-mono-nerd-font" # JetBrains 的编程字体
    # 终端美化
    install_tool "starship" "starship" # 跨 shell 的提示符定制工具

    # ===== 开发工具和配置 =====
    print_message "安装开发工具和配置..."
    # Neovim 配置
    install_lazyvim
    
    # 开发工具
    install_tool "Cursor" "--cask cursor" # 基于 VSCode 的 AI 编辑器

    # ===== 系统工具 =====
    print_message "安装系统工具..."
    install_tool "Wezterm" "--cask wezterm"                 # GPU 加速终端模拟器
    install_tool "Warp" "--cask warp"                       # 现代化的终端模拟器
    install_tool "Karabiner-Elements" "--cask karabiner-elements" # 键盘自定义工具
    install_tool "Raycast" "--cask raycast"                 # 启动器和效率工具
    # install_tool "Aerospace" "--cask aerospace"           # 窗口管理器
    install_tool "Loop" "--cask loop"                       # 循环播放器
    install_tool "微信输入法" "--cask wetype"               # 微信输入法

    print_message "所有工具安装完成！"
}

main