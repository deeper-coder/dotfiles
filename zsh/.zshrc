# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                              ZSH 配置文件                                    ║
# ║                          ~/.zshrc Configuration                              ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 基础环境变量
# ══════════════════════════════════════════════════════════════════════════════
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# ══════════════════════════════════════════════════════════════════════════════
# ▶ ZSH 核心配置
# ══════════════════════════════════════════════════════════════════════════════

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 历史记录配置                                                                  │
# └──────────────────────────────────────────────────────────────────────────────┘
HISTFILE=$HOME/.zhistory       # 历史记录存储文件
SAVEHIST=1000                  # 保存到文件的历史记录条数
HISTSIZE=999                   # 内存中保存的历史记录条数
setopt share_history           # 多个终端共享历史记录
setopt hist_expire_dups_first  # 空间不足时优先删除重复的历史记录
setopt hist_ignore_dups        # 忽略连续重复的命令
setopt hist_verify             # 执行历史记录命令前先显示，允许编辑

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 按键绑定                                                                      │
# └──────────────────────────────────────────────────────────────────────────────┘
bindkey '^[[A' history-search-backward  # ↑ 向上搜索历史
bindkey '^[[B' history-search-forward   # ↓ 向下搜索历史

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Oh-My-Zsh 配置                                                               │
# └──────────────────────────────────────────────────────────────────────────────┘
# 自动更新频率（单位：天）
# 可选模式: reminder(仅提醒) / disabled(禁用) / auto(自动更新)
zstyle ':omz:update' frequency 15

# 功能开关
ENABLE_CORRECTION="true"  # 启用命令自动纠正
CASE_SENSITIVE="true"     # 区分大小写补全
# HYPHEN_INSENSITIVE="true"        # 连字符不敏感补全
# DISABLE_MAGIC_FUNCTIONS="true"   # URL 粘贴修复
# DISABLE_LS_COLORS="true"         # 禁用 ls 颜色
# DISABLE_AUTO_TITLE="true"        # 禁用自动设置终端标题
# COMPLETION_WAITING_DOTS="true"   # 补全等待提示
# DISABLE_UNTRACKED_FILES_DIRTY="true"  # 禁用未跟踪文件的脏标记

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 主题配置                                                                      │
# └──────────────────────────────────────────────────────────────────────────────┘
# 设置 ZSH 主题 (设置为 "random" 可随机加载，运行 echo $RANDOM_THEME 查看当前主题)
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"

# Powerlevel10k 即时提示配置 (如启用，密码提示等交互代码需放在此块之上)
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Oh-My-Zsh 插件                                                               │
# └──────────────────────────────────────────────────────────────────────────────┘
plugins=(
  git                       # Git 命令增强和别名
  zsh-autosuggestions       # 命令自动建议（基于历史记录）
  zsh-syntax-highlighting   # 命令语法高亮
)

# 加载 Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 开发环境配置
# ══════════════════════════════════════════════════════════════════════════════

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Java / JDK 配置                                                              │
# │ 支持多版本 JDK 切换，使用别名快速切换                                           │
# └──────────────────────────────────────────────────────────────────────────────┘
export JAVA_17_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/zulu-8-arm64.jdk/Contents/Home
export JAVA_8_x64_HOME=/Library/Java/JavaVirtualMachines/zulu-8-x64.jdk/Contents/Home
export JAVA_HOME=$JAVA_17_HOME
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.

# JDK 版本切换别名
alias jdk17="export JAVA_HOME=$JAVA_17_HOME"
alias jdk11="export JAVA_HOME=$JAVA_11_HOME"
alias jdk8="export JAVA_HOME=$JAVA_8_HOME"
alias jdk8_64="export JAVA_HOME=$JAVA_8_x64_HOME"

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Golang 配置                                                                  │
# └──────────────────────────────────────────────────────────────────────────────┘
export GOROOT=/opt/homebrew/Cellar/go/1.21.5/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOBIN:$GOROOT/bin

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Conda 配置                                                                   │
# │ Python 虚拟环境管理器                                                         │
# └──────────────────────────────────────────────────────────────────────────────┘
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pluto/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pluto/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pluto/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pluto/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 命令行增强工具
# ══════════════════════════════════════════════════════════════════════════════

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ fzf - 模糊查找器                                                             │
# │ 功能：交互式命令行模糊搜索工具，支持文件、历史记录、进程等搜索                      │
# │ 快捷键：Ctrl+T(文件搜索) / Ctrl+R(历史搜索) / Alt+C(目录跳转)                   │
# └──────────────────────────────────────────────────────────────────────────────┘
source <(fzf --zsh)

# 默认命令：使用 fd 列出文件（包括隐藏文件，排除 .git）
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default"

# Ctrl+T：文件搜索
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Alt+C：目录跳转（仅列出目录）
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"

# 路径补全函数（使用 fd）
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# 目录补全函数（使用 fd）
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# 预览配置：目录使用 eza 树状显示，文件使用 bat 语法高亮
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# 高级自定义：针对不同命令使用不同预览
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ zoxide - 智能目录跳转                                                         │
# │ 功能：记住你访问过的目录，使用 z 命令快速跳转                                     │
# │ 用法：z <部分目录名> 即可跳转到最常访问的匹配目录                                 │
# └──────────────────────────────────────────────────────────────────────────────┘
eval "$(zoxide init zsh)"

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ starship - 跨 shell 提示符                                                   │
# │ 功能：快速、可定制的命令行提示符，显示 git 状态、语言版本等信息                    │
# │ 配置文件：~/.config/starship.toml                                            │
# └──────────────────────────────────────────────────────────────────────────────┘
eval "$(starship init zsh)"

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 编辑器配置
# ══════════════════════════════════════════════════════════════════════════════
export EDITOR="nvim"

# ══════════════════════════════════════════════════════════════════════════════
# ▶ API 密钥配置
# ══════════════════════════════════════════════════════════════════════════════
export AZURE_OPENAI_API_KEY="03f007c22d6c4583829e8e0b89035765"
export ALIYUN_API_KEY="sk-428846394b8544e89897118166ecfc10"
export DS_API_KEY="sk-efb71960d6d84c3980a7c6085c9edea6"
export DASHSCOPE_API_KEY="sk-428846394b8544e89897118166ecfc10"

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 网络代理配置（按需启用）
# ══════════════════════════════════════════════════════════════════════════════
# Socks5 代理
# export ALL_PROXY=socks5://127.0.0.1:2333
# HTTP/HTTPS 代理
# export http_proxy="http://127.0.0.1:10082"
# export https_proxy="http://127.0.0.1:10081"

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 命令别名
# ══════════════════════════════════════════════════════════════════════════════

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 编辑器别名                                                                    │
# │ nvim - Neovim，现代化的 Vim 编辑器                                            │
# └──────────────────────────────────────────────────────────────────────────────┘
alias vim='nvim'
alias vi='nvim'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'  # 交互式选择文件后用 nvim 打开

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 文件管理别名                                                                  │
# │ eza - ls 的现代替代品，支持图标、颜色和 Git 状态显示                             │
# └──────────────────────────────────────────────────────────────────────────────┘
alias ls="eza --icons=always"

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 目录导航别名                                                                  │
# │ z - zoxide 提供的智能目录跳转命令                                              │
# └──────────────────────────────────────────────────────────────────────────────┘
alias cd="z"

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ 帮助文档别名                                                                  │
# │ tldr - 简化版 man 手册，提供常用命令示例                                        │
# └──────────────────────────────────────────────────────────────────────────────┘
alias men='tldr'
export TLDR_LANGUAGE="zh"  # 使用中文文档

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ tmux 别名                                                                    │
# │ tmux - 终端复用器，支持分屏、会话管理                                           │
# └──────────────────────────────────────────────────────────────────────────────┘
alias tm='tmux'                   # 启动 tmux
alias tma='tmux a -t'             # 附加到指定会话
alias tml='tmux list-sessions'    # 列出所有会话
alias tmk='tmux kill-session -a'  # 关闭所有其他会话
alias tmn='tmux new -s'           # 新建命名会话
alias tmd='tmux detach'           # 分离当前会话

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Conda 别名                                                                   │
# └──────────────────────────────────────────────────────────────────────────────┘
alias ca='conda activate'  # 激活 conda 环境

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Shell 配置别名                                                               │
# └──────────────────────────────────────────────────────────────────────────────┘
alias szsh='source ~/.zshrc'  # 重新加载 zsh 配置

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 自定义函数
# ══════════════════════════════════════════════════════════════════════════════

# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ yazi 文件管理器包装函数                                                        │
# │ yazi - 终端文件管理器，支持预览、批量操作                                        │
# │ 功能：退出 yazi 后自动切换到最后浏览的目录                                       │
# └──────────────────────────────────────────────────────────────────────────────┘
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ══════════════════════════════════════════════════════════════════════════════
# ▶ 其他配置（按需启用）
# ══════════════════════════════════════════════════════════════════════════════
# 系统信息显示
# neofetch

# 编译标志（用于特定架构编译）
# export ARCHFLAGS="-arch x86_64"
