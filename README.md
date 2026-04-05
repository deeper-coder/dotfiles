# 🖥️ My Dotfiles

> macOS 开发环境配置仓库，包含工具安装脚本、配置文件和应用清单，支持公司/个人电脑的快速迁移。

---

## 📑 目录

- [快速开始](#-快速开始)
- [工具安装](#-工具安装)
- [应用安装](#-应用安装)
  - [公司电脑模式](#公司电脑模式)
  - [个人电脑模式](#个人电脑模式)
- [应用清单](#-应用清单)
- [配置文件](#-配置文件)
- [注意事项](#-注意事项)

---

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/deeper-coder/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. 安装流程

```bash
# Step 1: 安装基础开发工具（通用）
./install_tools.sh

# Step 2: 安装应用程序（根据需求选择）
./install_apps.sh  # 公司电脑模式

# Step 3: 创建配置文件链接
./setup_configs.sh
```

---

## 🔧 工具安装

运行 `./install_tools.sh` 会安装以下开发工具（适用于所有场景）：

### 包管理器

| 工具 | 简介 |
|------|------|
| Homebrew | macOS 的包管理器 |

### 核心命令行工具

| 工具 | 简介 |
|------|------|
| git | 版本控制系统 |
| lua | 脚本语言 |
| tmux | 终端复用工具 |

### ZSH 环境

| 工具 | 简介 |
|------|------|
| zsh | 现代化 shell |
| Oh My Zsh | zsh 配置框架 |
| zsh-autosuggestions | 命令自动补全插件 |
| zsh-syntax-highlighting | 语法高亮插件 |

### 命令行增强

| 工具 | 简介 |
|------|------|
| bat | 更好的 cat 替代品 |
| bpytop | 资源监控工具 |
| cloc | 代码行数统计 |
| eza | 现代化的 ls 替代品 |
| fd | 更快的文件查找工具 |
| fzf | 模糊查找工具 |
| tlrc | 简化版命令手册 |
| tree | 目录树显示工具 |
| yazi | 终端文件管理器 |
| zoxide | 智能目录跳转 |

### 字体和主题

| 工具 | 简介 |
|------|------|
| Hack Nerd Font | 编程字体 |
| JetBrains Mono Nerd Font | 编程字体 |
| MesloLGS Nerd Font | 编程字体 |
| starship | 跨 shell 提示符 |

### Neovim 配置

| 工具 | 简介 |
|------|------|
| LazyVim | 现代化的 Neovim 配置框架 |

---

## 📦 应用安装

### 公司电脑模式

运行 `./install_apps.sh` 进行交互式安装，适合公司电脑的精简配置：

#### 系统增强

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Command X | `command-x` | Finder 剪切粘贴 |
| Karabiner-Elements | `karabiner-elements` | 键盘自定义工具 |
| Mos | `mos` | 鼠标滚轮平滑 |
| QLMarkdown | `qlmarkdown` | Markdown 快速预览 |
| Syntax Highlight | `syntax-highlight` | 代码语法高亮预览 |

#### 窗口管理

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| AltTab | `alt-tab` | Windows 风格窗口切换 |
| Loop | `loop` | 环形窗口管理器 |

#### 效率工具

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Itsycal | `itsycal` | 菜单栏日历 |
| OpenInTerminal | `openinterminal` | Finder 快开终端 |
| Raycast | `raycast` | 现代启动器 |

#### 文件管理

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| PearCleaner | `pearcleaner` | 应用卸载清理 |
| Keka | `keka` | 压缩解压工具 |

#### 截图与录屏

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Snipaste | `snipaste` | 截图与贴图工具 |

#### 菜单栏管理

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Ice | `ice` | 菜单栏图标管理 |

#### 系统监控与维护

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Macs Fan Control | `macs-fan-control` | 风扇转速控制 |
| Stats | `stats` | 系统状态监控 |

#### 开发工具

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Antigravity | `antigravity` | AI 代码编辑器 |
| Warp | `warp` | 现代化终端 |

#### 浏览器

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Arc | `arc` | Chromium系浏览器 |
| Zen | `zen` | Firefox系浏览器 |

#### 多媒体

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| IINA | `iina` | 现代视频播放器 |
| PictureView | `pictureview` | 图片浏览器 |

#### 阅读与学习

| 应用 | Brew 包名 | 简介 |
|------|-----------|------|
| Skim | `skim` | 轻量 PDF 阅读器 |

---

### 个人电脑模式

个人电脑可以安装更完整的应用套件，以下是完整清单：

#### 🔧 系统增强

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| AltTab | Windows 风格窗口切换 | 🆓 | ✅ |
| BetterDisplay | 显示器管理工具 | 🆓 | ✅ |
| Command X | Finder 剪切粘贴 | 🆓 | ✅ |
| Folder Preview | 文件夹内容预览 | 🆓 | ❌ |
| Karabiner-Elements | 键盘自定义工具 | 🆓 | ✅ |
| BetterMouse | 鼠标滚轮平滑 | 🆓 | ✅ |
| QLMarkdown | Markdown 快速预览 | 🆓 | ✅ |
| Syntax Highlight | 代码语法高亮预览 | 🆓 | ✅ |
| 右键助手专业版 | 右键菜单增强 | 💰 | ❌ |

#### 🪟 窗口管理

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Loop | 环形窗口管理器 | 🆓 | ✅ |
| Swish | 触控板手势窗口控制 | 💰 | ✅ |
| Wins | 现代窗口管理工具 | 💰 | ✅ |

#### ⚡ 效率工具

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Bitwarden | 开源密码管理器 | 🆓 | ✅ |
| Dropover | 拖放暂存架 | 💰 | ✅ |
| Itsycal | 菜单栏日历 | 🆓 | ✅ |
| OpenInTerminal | Finder 快开终端 | 🆓 | ✅ |
| PopClip | 选中文本操作菜单 | 💰 | ✅ |
| Raycast | 现代启动器 | 🆓 | ✅ |

#### 🤖 AI 助手

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| ChatGPT | AI 助手 | 🆓 | ✅ |

#### 📁 文件管理

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| App Cleaner & Uninstaller | 应用卸载清理 | 💰 | ❌ |
| Keka | 压缩解压工具 | 🆓 | ✅ |
| 文件夹夹 | 快速访问文件夹 | 💰 | ❌ |

#### 📸 截图与录屏

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| iShot Pro | 专业截图录屏工具 | 💰 | ❌ |

#### 📊 菜单栏管理

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Alcove | 刘海屏增强 | 💰 | ✅ |
| Bartender 5 | 菜单栏图标管理 | 💰 | ✅ |

#### 🖥️ 系统监控与维护

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| AlDente Pro | 电池健康管理 | 💰 | ✅ |
| iMazing | iOS 设备管理 | 💰 | ✅ |
| Macs Fan Control | 风扇转速控制 | 🆓 | ✅ |
| Stats | 系统状态监控 | 🆓 | ✅ |
| WhatPulse | 使用统计分析 | 💰 | ❌ |

#### 💻 开发工具

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Antigravity | AI 代码编辑器 | 🆓 | ✅ |
| OrbStack | 轻量 Docker 虚拟机 | 🆓 | ✅ |
| Warp | 现代化终端 | 🆓 | ✅ |
| Zed | 高性能编辑器 | 🆓 | ✅ |

#### 🌐 浏览器

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Arc | 革新性浏览器 | 🆓 | ✅ |
| Orion | WebKit 隐私浏览器 | 🆓 | ✅ |
| Zen Browser | 极简 Firefox 分支 | 🆓 | ✅ |

#### 🖼️ 壁纸与美化

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Unsplash Wallpapers | 壁纸工具 | 🆓 | ❌ |

#### 🎬 多媒体

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| IINA | 现代视频播放器 | 🆓 | ✅ |
| Pear Desktop | 音乐客户端 | 🆓 | ✅ |
| PictureView | 图片浏览器 | 🆓 | ✅ |

#### 💬 社交通讯

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| 钉钉 | 企业办公平台 | 🆓 | ✅ |
| 飞书 | 协作办公平台 | 🆓 | ✅ |
| 腾讯会议 | 视频会议工具 | 🆓 | ✅ |
| 微信 | 即时通讯工具 | 🆓 | ✅ |
| vivo 办公套件 | vivo 设备互联 | 🆓 | ❌ |

#### 📚 阅读与学习

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Skim | 轻量 PDF 阅读器 | 🆓 | ✅ |
| Zotero | 文献管理工具 | 🆓 | ✅ |
| 微信读书 | 电子书阅读平台 | 🆓 | ❌ |
| 小红书 | 生活方式社区 | 🆓 | ❌ |

#### 🌍 网络代理

| 应用 | 简介 | 价格 | Brew |
|------|------|:----:|:----:|
| Shadowrocket | 网络代理工具 | 💰 | ❌ |

---

## 🚀 Homebrew 快速安装

### 安装 Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 一键安装所有免费应用（个人电脑）

```bash
# 系统增强
brew install --cask alt-tab betterdisplay command-x karabiner-elements bettermouse qlmarkdown syntax-highlight

# 窗口管理
brew install --cask loop

# 效率工具
brew install --cask bitwarden itsycal openinterminal raycast

# 文件管理
brew install --cask keka

# 系统监控
brew install --cask macs-fan-control stats

# 开发工具
brew install --cask antigravity orbstack warp zed

# 浏览器
brew install --cask arc orion zen-browser

# 多媒体
brew install --cask iina pictureview
brew install pear-devs/pear-desktop

# 社交通讯
brew install --cask dingtalk feishu tencent-meeting wechat

# 阅读
brew install --cask skim zotero

# AI 助手
brew install --cask chatgpt
```

### 完整一行命令

```bash
brew install --cask alt-tab betterdisplay command-x karabiner-elements bettermouse qlmarkdown syntax-highlight loop bitwarden itsycal openinterminal raycast keka macs-fan-control stats antigravity orbstack warp zed arc orion zen-browser iina pictureview dingtalk feishu tencent-meeting wechat skim zotero chatgpt
brew install pear-devs/pear-desktop
```

---

## 💰 付费应用清单

以下应用需要从 Mac App Store 或官网购买：

| 类别 | 应用 | 简介 | 购买渠道 |
|------|------|------|----------|
| 系统增强 | 右键助手专业版 | 右键菜单增强 | App Store |
| 窗口管理 | Swish | 触控板手势窗口控制 | 官网 / Setapp |
| 窗口管理 | Wins | 现代窗口管理工具 | App Store / Brew |
| 效率工具 | Dropover | 拖放暂存架 | App Store |
| 效率工具 | PopClip | 选中文本操作菜单 | App Store |
| 文件管理 | App Cleaner & Uninstaller | 应用卸载清理 | 官网 / App Store |
| 文件管理 | 文件夹夹 | 快速访问文件夹 | App Store |
| 截图与录屏 | iShot Pro | 专业截图录屏工具 | App Store |
| 菜单栏管理 | Alcove | 刘海屏增强 | 官网 |
| 菜单栏管理 | Bartender 5 | 菜单栏图标管理 | 官网 / Setapp |
| 系统监控 | AlDente Pro | 电池健康管理 | 官网 |
| 系统监控 | iMazing | iOS 设备管理 | 官网 |
| 系统监控 | WhatPulse | 使用统计分析 | 官网 |
| 网络代理 | Shadowrocket | 网络代理工具 | App Store（非中国区） |

---

## ⚙️ 配置文件

运行 `./setup_configs.sh` 会创建以下配置文件的符号链接：

| 配置 | 源文件 | 目标位置 |
|------|--------|----------|
| Neovim | `configs/editor/nvim/` | `~/.config/nvim` |
| VSCode Neovim | `configs/editor/vscode/vscode_neovim/init.lua` | `~/.config/vscode_neovim/init.lua` |
| IdeaVim | `configs/editor/ideavim/.ideavimrc` | `~/.ideavimrc` |
| Zsh | `configs/shell/zsh/.zshrc` | `~/.zshrc` |
| Starship | `configs/shell/starship/starship.toml` | `~/.config/starship.toml` |
| Tmux | `configs/terminal/tmux/.tmux.conf` | `~/.tmux.conf` |
| Wezterm | `configs/terminal/wezterm/.wezterm.lua` | `~/.wezterm.lua` |
| Ghostty | `configs/terminal/ghostty/config` | `~/.config/ghostty/config` |
| Yazi | `configs/terminal/yazi/*.toml` | `~/.config/yazi/*.toml` |
| Karabiner | `configs/system/karabiner/karabiner.json` | `~/.config/karabiner/karabiner.json` |

> 💡 原有配置文件会自动备份为 `*.backup`

---

## ⚠️ 注意事项

1. **按顺序执行**：建议按照 `install_tools.sh` → `install_apps.sh` → `setup_configs.sh`  的顺序执行
2. **选择性安装**：每个脚本都支持交互式选择，可以根据需要选择要安装的工具
3. **自动备份**：配置文件会自动备份原有的配置为 `*.backup`
4. **重启终端**：完成安装后请重启终端以使配置生效
5. **网络环境**：部分工具安装需要良好的网络环境

---

## 📄 License

本项目采用 [MIT](LICENSE) 协议。

---

<p align="center">
  <i>⭐ 如果这个仓库对你有帮助，欢迎 Star！</i>
</p>
