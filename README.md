# 我的 dotfiles

这是一个用于个人开发环境的 dotfiles 配置仓库，包含了多种开发工具的配置文件和自动化安装脚本，旨在提升开发效率和使用体验。

## 包含的配置

### 终端相关
- WezTerm 终端配置
- Tmux 终端复用器配置
- Zsh shell配置（包含 Oh My Zsh 和插件）

### 编辑器相关
- LazyVim 配置
- IdeaVim 配置

### 系统工具
- Karabiner-Elements 键盘映射配置
- Aerospace 窗口管理配置
- Keka 解压缩工具配置
- Zen 浏览器配置
- Notion 笔记应用配置

## 自动化安装

这个仓库包含两个主要的安装脚本：

### 1. 安装软件包 (`install_packages.sh`)

这个脚本会自动安装所有需要的软件包和工具：

- 包管理器：
  - Homebrew（如果未安装）

- 终端工具：
  - zsh (shell)
  - tmux (终端复用器)
  - Nerd Font 字体
  - Oh My Zsh 及其插件（包括 zsh-autosuggestions 和 zsh-syntax-highlighting）

- 开发工具：
  - LazyVim (编辑器)
  - xray (代理工具)

- 命令行增强工具：
  - eza (ls 替代品)
  - fzf (模糊查找)
  - zoxide (智能 cd)
  - tldr (命令手册)
  - bat (文本查看增强工具)

- GUI 应用：
  - Karabiner-Elements (键盘映射)
  - Raycast (系统启动器)
  - Loop (系统分屏工具)
  - Skim, QLMarkdown, Syntax-Highlight (文档工具)
  - LyricsX (歌词工具)
  - Keka (解压缩工具)
  - Zen (浏览器)
  - Notion (笔记应用)

### 2. 设置配置文件 (`setup_configs.sh`)

这个脚本会自动创建所有必要的配置文件链接。

## 使用方法

1. 克隆仓库：
```bash
git clone https://github.com/deeper-coder/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
2. 安装所需软件包
```bash
./install_packages.sh
```
3. 设置配置文件
```bash
./setup_configs.sh
```
4. 重启终端