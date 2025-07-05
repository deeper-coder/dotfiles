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
    
    # ===== 网络浏览类 =====
    print_message "安装网络浏览类应用..."
    install_tool "Arc 浏览器" "arc"  # 现代化浏览器，具有空间管理功能
    
    # ===== 文档与阅读类 =====
    print_message "安装文档与阅读类应用..."
    install_tool "Skim" "skim"                    # PDF阅读器，支持注释
    install_tool "QLMarkdown" "qlmarkdown"        # Markdown快速预览插件
    install_tool "Syntax-Highlight" "syntax-highlight"  # 代码语法高亮预览插件
    install_tool "Notion" "notion"                # 多功能笔记和知识管理工具
    install_tool "EasyDict" "easydict"            # 快捷翻译工具
    install_tool "TextSniper" "textsniper"        # OCR文字识别工具
    
    # ===== 系统增强类 =====
    print_message "安装系统增强类应用..."
    install_tool "AltTab" "alt-tab"               # 窗口切换增强工具
    install_tool "Logi Options+" "logi-options+"  # 罗技设备管理软件
    # install_tool "App Cleaner" "app-cleaner"    # 应用卸载清理工具
    install_tool "Command-X" "command-x"          # 添加剪切功能到Finder
    install_tool "Mos" "mos"                      # 鼠标滚动平滑工具
    install_tool "Itsycal" "itsycal"              # 菜单栏日历工具
    install_tool "Swish" "swish"                  # 触控板手势增强工具
    install_tool "Ice" "ice"                      # 网页应用打包工具
    # install_tool "Wins" "wins"                  # 窗口管理工具
    
    # ===== 多媒体处理类 =====
    print_message "安装多媒体处理类应用..."
    install_tool "IINA" "iina"                    # 现代化视频播放器
    install_tool "PictureView" "pictureview"      # 图片查看工具
    
    # ===== 实用工具类 =====
    print_message "安装实用工具类应用..."
    install_tool "Keka" "keka"                    # 文件压缩解压工具
    install_tool "Snipaste" "snipaste"            # 截图与贴图工具
    
    # ===== 社交通讯类 =====
    print_message "安装社交通讯类应用..."
    install_tool "微信" "wechat"                  # 即时通讯软件
    install_tool "飞书" "feishu"                  # 团队协作平台
    install_tool "钉钉" "dingtalk"                # 企业通讯与协作平台

    print_message "所有应用安装完成！"
}

main