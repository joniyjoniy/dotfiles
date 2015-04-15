#########################
# 一般設定
#########################

export LANG=ja_JP.UTF-8
export XMODIFIRES=@im=uim
export PATH="$PATH":/home/13t264/.cask/bin


#########################
# history
#########################

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 重複したコマンドラインをヒストリから削除
setopt hist_ignore_all_dups
# コマンドがスペースから始まる場合、ヒストリに追加しない
setopt hist_ignore_space
#履歴ファイルに時刻を記録
setopt extended_history

########################################
# 補完
#########################################

# 補完
autoload -U compinit
compinit
# <tab>連打で候補選択
zstyle ':completion:*:default' menu select=1
# 補完時に大文字小文字を区別しない
zstyle 'completion:*' matcher-list 'm:{a-z}={A-Z}'

##########################
#alias
##########################

alias ls='ls -G'
alias ks='ls'
alias ll='ls -l'
alias ls='ls --color=auto'
alias e='emacs'
alias zshload='source ~/.zshrc'
alias tmux='tmux -2'
alias tmuxa='tmux a -t'
alias tmuxk='tmux kill-session'
alias tmuxl='tmux list-session'

###############################
#プロンプト設定
#################################
PROMPT="
%D{%Y-%m-%d %H:%M:%S} %n@%m:%d
%# "
