# -------------------------- 基础路径配置 --------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# -------------------------- 主题相关配置 --------------------------
# 设置 ZSH 主题
# 如果设置为 "random"，每次加载 oh-my-zsh 时会随机加载一个主题
# 要查看加载了哪个主题，运行: echo $RANDOM_THEME
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"

# 随机主题候选列表
# 当 ZSH_THEME=random 时，将从这个列表中选择主题
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Powerlevel10k 即时提示配置
# 需要控制台输入的初始化代码（如密码提示、[y/n]确认等）必须放在此块之上
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Powerlevel10k 主题配置
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------------------------- 开发环境配置 --------------------------
# JDK 配置
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

# Golang 配置
export GOROOT=/opt/homebrew/Cellar/go/1.21.5/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOBIN:$GOROOT/bin

# RabbitMQ 配置
export RABBIT_HOME=/opt/homebrew/Cellar/rabbitmq/3.12.12
export PATH=$PATH:$RABBIT_HOME/sbin

# -------------------------- 网络代理配置 --------------------------
# Socks5 代理
export ALL_PROXY=socks5://127.0.0.1:10080
# HTTP/HTTPS 代理
# export http_proxy="http://127.0.0.1:10082"
# export https_proxy="http://127.0.0.1:10081"

# -------------------------- ZSH 功能配置 --------------------------
# 自动更新设置
# zstyle ':omz:update' mode reminder  # 仅提醒更新
# zstyle ':omz:update' mode disabled  # 禁用自动更新
# zstyle ':omz:update' mode auto      # 自动更新
zstyle ':omz:update' frequency 15   # 更新频率（天）

# 功能开关设置
ENABLE_CORRECTION="true"    # 启用命令自动纠正
CASE_SENSITIVE="true"     # 区分大小写补全
# HYPHEN_INSENSITIVE="true" # 连字符不敏感补全
# DISABLE_MAGIC_FUNCTIONS="true"  # URL 粘贴修复
# DISABLE_LS_COLORS="true"        # 禁用 ls 颜色
# DISABLE_AUTO_TITLE="true"       # 禁用自动设置终端标题
# COMPLETION_WAITING_DOTS="true"  # 补全等待提示
# DISABLE_UNTRACKED_FILES_DIRTY="true"  # 禁用未跟踪文件的脏标记

# 插件配置
plugins=(git zsh-autosuggestions)

# 加载 oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -------------------------- Conda 环境配置 --------------------------
# Conda 初始化配置（由 conda init 管理）
__conda_setup="$('/Users/pluto/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pluto/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pluto/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pluto/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# -------------------------- 其他可选配置 --------------------------
# 系统资源显示
# neofetch

# 编译标志
# export ARCHFLAGS="-arch x86_64"eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# 默认命令：列出所有文件和目录（包括隐藏文件，但排除 .git）
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default"

# Ctrl+T 快捷键：调用与默认命令相同的行为
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Alt+C 快捷键：只列出目录（包括隐藏目录，但排除 .git）
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
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

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify


# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# -------------------------- 命令别名配置 --------------------------
alias vim='nvim'
alias vi='nvim'
alias woman='tldr'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias ls="eza --icons=always"
alias cd="z"