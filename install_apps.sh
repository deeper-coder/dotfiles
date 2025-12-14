#!/bin/bash

# 设置颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 打印信息函数
print_message() {
    echo -e "${GREEN}==>${NC} $1"
}

# 安装工具的函数
install_tool() {
    if [[ "$AUTO_INSTALL" == "y" ]]; then
        print_message "正在安装 $1..."
        brew install --cask $2
        print_message "$1 安装完成！"
    else
        read -p "是否安装 $1? (y/n): " choice
        if [[ "$choice" == "y" ]]; then
            print_message "正在安装 $1..."
            brew install --cask $2
            print_message "$1 安装完成！"
        else
            print_message "$1 安装被跳过。"
        fi
    fi
}

# 主安装函数
main() {
    print_message "开始安装应用软件..."
    
    # 询问是否一键安装所有应用
    read -p "是否一键安装所有应用? (y/n): " AUTO_INSTALL
    export AUTO_INSTALL

    # ===== 系统增强 =====
    print_message "安装系统增强..."
    install_tool "Command X" "command-x"
    install_tool "Karabiner-Elements" "karabiner-elements"
    install_tool "Mos" "mos"
    install_tool "QLMarkdown" "qlmarkdown"
    install_tool "Syntax Highlight" "syntax-highlight"

    # ===== 窗口管理 =====
    print_message "安装窗口管理..."
    # install_tool "Aerospace" "aerospace"
    install_tool "AltTab" "alt-tab"
    install_tool "Loop" "loop"
    # install_tool "Swish" "swish"
    # install_tool "Wins" "wins"

    # ===== 效率工具 =====
    print_message "安装效率工具..."
    # install_tool "Bitwarden" "bitwarden"
    install_tool "Itsycal" "itsycal"
    install_tool "OpenInTerminal" "openinterminal"
    install_tool "Raycast" "raycast"
    install_tool "TextSniper" "textsniper"

    # ===== 文件管理 =====
    print_message "安装文件管理..."
    # install_tool "App Cleaner" "app-cleaner"
    install_tool "Keka" "keka"

    # ===== 截图与录屏 =====
    print_message "安装截图与录屏..."
    install_tool "Snipaste" "snipaste"

    # ===== 菜单栏管理 =====
    print_message "安装菜单栏管理..."
    install_tool "Ice" "ice"

    # ===== 系统监控与维护 =====
    print_message "安装系统监控与维护..."
    install_tool "Macs Fan Control" "macs-fan-control"
    install_tool "Stats" "stats"

    # ===== 开发工具 =====
    print_message "安装开发工具..."
    install_tool "Cursor" "cursor"
    install_tool "Warp" "warp"
    # install_tool "Wezterm" "wezterm"

    # ===== 浏览器 =====
    print_message "安装浏览器..."
    install_tool "Arc" "arc"

    # ===== 多媒体 =====
    print_message "安装多媒体..."
    install_tool "IINA" "iina"
    install_tool "PictureView" "pictureview"

    # ===== 社交通讯 =====
    print_message "安装社交通讯..."
    # install_tool "钉钉" "dingtalk"
    # install_tool "飞书" "feishu"
    # install_tool "微信" "wechat"

    # ===== 阅读与学习 =====
    print_message "安装阅读与学习..."
    install_tool "Skim" "skim"
    # install_tool "Zotero" "zotero"

    # ===== 外设驱动 =====
    print_message "安装外设驱动..."
    install_tool "Logi Options+" "logi-options-plus"

    # ===== 输入法 =====
    print_message "安装输入法..."
    install_tool "微信输入法" "wetype"

    print_message "所有应用安装完成！"
}

main
