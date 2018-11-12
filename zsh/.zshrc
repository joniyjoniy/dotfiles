#########################
# 環境設定
#########################
export LANG=ja_JP.UTF-8
export XMODIFIRES=@im=uim
export TERM="xterm-256color"
export EDITOR="emacs -nw"
export GREP_OPTION="--color=auto"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# 色を使用出来るようにする
autoload -Uz colors
colors

##########################
# キーバインド
##########################

# emacs 風キーバインドにする
bindkey -e
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

##########################
# オプション
##########################

# 履歴を複数の端末で共有する
setopt share_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# 複数のzshを同時に使用した際に履歴ファイルを上書きせず追加する
setopt append_history
# 履歴ファイルにzsh の開始・終了時刻を記録する
setopt extended_history
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# ディレクトリ名だけでcdする
setopt auto_cd
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu
# 補完候補一覧でファイルの種別をマーク表示
setopt list_types
# 補完候補を一覧表示
setopt auto_list
# 補完候補を詰めて表示
setopt list_packed
# カッコの対応などを自動的に補完
setopt auto_param_keys
# バックグラウンドジョブの状態変化を即時報告
setopt notify

##########################
# 補完
##########################

autoload -Uz compinit
compinit
# <tab>連打で候補選択
zstyle ':completion:*:default' menu select=1
# 補完時に大文字小文字を区別しない
zstyle 'completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
# 補完候補に色を付ける
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

##########################
# エイリアス
##########################

# グローバルエイリアス
alias -g N='> /dev/null 2> /dev/null &'
# ユーザ定義
alias ls='ls -G'
alias ks='ls'
alias ll='ls -l'
alias emacs='emacs -nw'
alias zshload='source ~/.zshrc'
alias tmux='tmux -2'
alias tmuxa='tmux a -t'
alias tmuxk='tmux kill-session -t'
alias tmuxl='tmux list-session'
alias gls="git status"
alias gsl="git status"
alias gch="git checkout"
alias gbr="git branch"
alias gmf="git merge --no-ff"
alias gdm="git branch --merged | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset' --abbrev-commit --date=relative"
alias gad="git add"
alias gco="git commit"
alias gpu="git push"
alias gpl="git pull"
alias gdi="git diff"
alias be="bundle exec"

###############################
#プロンプト
###############################
PROMPT="%D{%Y-%m-%d %H:%M:%S} %n@%m:%d
%# "
#RPROMPT
RPROMPT=$'`branch-status-check`'
# 表示毎にPROMPTで設定されている文字列を評価する
setopt prompt_subst
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
function branch-status-check() {
    local branchname suffix
    # .gitの中だから除外
    [[ '$PWD' =~ '/\.git(/.*)?$' ]] && return
    branchname=`get-branch-name`
    # ブランチ名が無いので除外
    [[ -z $branchname ]] && return
    suffix='%{'${reset_color}'%}'
    echo `get-branch-status`${suffix}
}
function get-branch-name() {
    local git==git
    # gitディレクトリじゃない場合のエラーを捨てる
    echo `${git} rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status() {
    local git==git branchstatus branchname
    branchname=`get-branch-name`
    output=`${git} status 2> /dev/null`
    if [[ -n `echo $output | grep '^nothing to commit'` ]]; then
        branchstatus='%{'${fg[green]}'%}⮂%{'${fg[black]}${bg[green]}'%} ⭠ '${branchname}
    elif [[ -n `echo $output | grep '^Untracked files:'` ]]; then
        branchstatus='%{'${fg[yellow]}'%}⮂%{'${fg[black]}${bg[yellow]}'%} ⭠ '${branchname}
    elif [[ -n `echo $output | grep '^Changes not staged for commit:'` ]]; then
        branchstatus='%{'${fg[red]}'%}⮂%{'${fg[black]}${bg[red]}'%} ⭠ '${branchname}
    else
        branchstatus='%{'${fg[cyan]}'%}⮂%{'${fg[black]}${bg[cyan]}'%} ⭠ '${branchname}
    fi
    echo ${branchstatus}' '
}

# ###############################
# # powerline-shell
# ###############################

# powerline_shell_path=$HOME'/src/powerline-shell/powerline-shell.py'
# if [ -f $powerline_shell_path ]; then
#     function powerline_precmd() {
#         PS1=$'\n'"$($powerline_shell_path --mode flat $? --shell zsh) "
#     }
#     function install_powerline_precmd() {
#         for s in '${precmd_functions[@]}'; do
#             [ '$s' = 'powerline_precmd' ] && return
#         done
#         precmd_functions+=(powerline_precmd)
#     }
#     if [ '$TERM' != 'linux' ]; then
#         install_powerline_precmd
#     fi
# fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joniyjoniy/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joniyjoniy/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joniyjoniy/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joniyjoniy/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
