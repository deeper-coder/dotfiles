#!/bin/bash

# 设置颜色输出
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 获取当前目录的绝对路径
DOTFILES=$(pwd)

# 打印信息函数
print_message() {
    echo -e "${GREEN}==>${NC} $1"
}

# 创建符号链接函数
create_link() {
    local src=$1
    local dst=$2
    if [ -e "$dst" ]; then
        print_message "备份已存在的 $dst 到 ${dst}.backup"
        mv "$dst" "${dst}.backup"
    fi
    ln -sf "$src" "$dst"
    print_message "创建链接: $src -> $dst"
}

# 设置 Yazi 配置
setup_yazi() {
    print_message "设置 Yazi 配置..."
    mkdir -p ~/.config/yazi
    create_link "$DOTFILES/yazi/yazi.toml" ~/.config/yazi/yazi.toml
    create_link "$DOTFILES/yazi/keymap.toml" ~/.config/yazi/keymap.toml
    create_link "$DOTFILES/yazi/theme.toml" ~/.config/yazi/theme.toml
    print_message "Yazi 配置完成！"
}

# 主设置函数
main() {
    print_message "开始创建配置文件链接..."

    # 创建必要的配置目录
    mkdir -p ~/.config/nvim
    mkdir -p ~/.config/wezterm
    mkdir -p ~/.config/karabiner
    mkdir -p ~/.tmux
    mkdir -p ~/.config/vscode_neovim
    # mkdir -p ~/.config/aerospace

    # 创建配置文件链接
    create_link "$DOTFILES/nvim" ~/.config/nvim
    create_link "$DOTFILES/wezterm/.wezterm.lua" ~/.wezterm.lua
    create_link "$DOTFILES/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
    create_link "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf
    create_link "$DOTFILES/zsh/.zshrc" ~/.zshrc
    create_link "$DOTFILES/ideavim/.ideavimrc" ~/.ideavimrc
    create_link "$DOTFILES/vscode_neovim/init.lua" ~/.config/vscode_neovim/init.lua
    # create_link "$DOTFILES/aerospace/.aerospace.toml" ~/.config/aerospace/aerospace.toml

    # 设置 Yazi 配置
    setup_yazi
    
    print_message "配置文件链接创建完成！"
    print_message "请重启终端以使更改生效。"
}

main