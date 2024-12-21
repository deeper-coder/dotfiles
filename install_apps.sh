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
    
    print_message "安装浏览器类..."
    install_tool "Zen 浏览器" "zen-browser"
    install_tool "Arc 浏览器" "arc"
    
    print_message "安装文档工具类..."
    install_tool "Skim" "skim"
    install_tool "QLMarkdown" "qlmarkdown"
    install_tool "Syntax-Highlight" "syntax-highlight"
    install_tool "Notion" "notion"
    install_tool "EasyDict" "easydict"
    install_tool "TextSniper" "textsniper"
    
    print_message "安装系统工具类..."
    install_tool "AltTab" "alt-tab"
    install_tool "Logi Options+" "logi-options+"
    install_tool "OrbStack" "orbstack"
    install_tool "App Cleaner" "app-cleaner"
    install_tool "Command-X" "command-x"
    install_tool "Mos" "mos"
    install_tool "Itsycal" "itsycal"
    install_tool "Swish" "swish"
    install_tool "Bartender" "bartender"
    install_tool "Wins" "wins"
    
    print_message "安装媒体工具类..."
    install_tool "LyricsX" "brewforge/extras/lyricsx-mxiris"
    install_tool "IINA" "iina"
    install_tool "PictureView" "pictureview"
    
    print_message "安装实用工具类..."
    install_tool "Keka" "keka"
    install_tool "Snipaste" "snipaste"
    install_tool "Cork" "cork"
    
    print_message "安装社交通讯类..."
    install_tool "微信" "wechat"
    install_tool "飞书" "feishu"
    install_tool "钉钉" "dingtalk"
    install_tool "QQ" "qq"

    print_message "所有应用安装完成！"
}

main