# 我的 dotfiles

这是一个用于个人开发环境的 dotfiles 配置仓库，包含了多种开发工具的配置文件和自动化安装脚本，旨在提升开发效率和使用体验。

## 安装步骤

### 1. 克隆仓库
```bash
git clone https://github.com/deeper-coder/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. 安装基础开发工具
```bash
./install_tools.sh
```

该脚本会安装以下工具：

#### 包管理器
- Homebrew：macOS 的包管理器

#### 终端环境
- zsh：现代化的 shell 环境
- tmux：强大的终端复用工具
- WezTerm：跨平台终端模拟器
- Nerd Font：带图标的编程字体

#### 命令行增强
- eza：现代化的 ls 替代品
- tree：目录树显示工具
- fd：更快的文件查找工具
- fzf：模糊查找工具
- zoxide：智能目录跳转
- bat：更好的 cat 替代品
- tldr：简化版命令手册

#### 开发工具
- LazyVim：现代化的 Neovim 配置框架
- Cursor：AI 辅助的代码编辑器

#### 系统工具
- Karabiner-Elements：键盘自定义工具
- Raycast：效率启动器
- Aerospace：窗口管理工具
- Loop：窗口分屏工具

### 3. 设置配置文件
```bash
./setup_configs.sh
```

该脚本会自动配置：
- Neovim/LazyVim 配置
- WezTerm 终端配置
- Tmux 配置
- Zsh 配置
- IdeaVim 配置
- Karabiner 配置

### 4. 安装应用程序（可选）
```bash
./install_apps.sh
```

该脚本会安装以下应用：

#### 网络浏览类
- Arc：现代化浏览器，具有空间管理功能

#### 文档与阅读类
- Skim：PDF 阅读器，支持注释
- QLMarkdown：Markdown 快速预览插件
- Syntax-Highlight：代码语法高亮预览插件
- Notion：多功能笔记和知识管理工具
- EasyDict：快捷翻译工具
- TextSniper：OCR 文字识别工具

#### 系统增强类
- AltTab：窗口切换增强工具
- Logi Options+：罗技设备管理软件
- Command-X：添加剪切功能到 Finder
- Mos：鼠标滚动平滑工具
- Itsycal：菜单栏日历工具
- Swish：触控板手势增强工具
- Ice：网页应用打包工具

#### 多媒体处理类
- IINA：现代化视频播放器
- PictureView：图片查看工具

#### 实用工具类
- Keka：文件压缩解压工具
- Snipaste：截图与贴图工具

#### 社交通讯类
- 微信：即时通讯软件
- 飞书：团队协作平台
- 钉钉：企业通讯与协作平台

## 注意事项

1. 建议按照顺序执行安装步骤
2. 每个脚本都支持选择性安装，可以根据需要选择要安装的工具
3. 配置文件会自动备份原有的配置
4. 完成安装后请重启终端以使配置生效
