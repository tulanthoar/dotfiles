# Add yourself some shortcuts to projects you often work on
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}
function p-paste() {
    OLDC=CURSOR
    RBUFFER="`python3 /home/man/PycharmProjects/tldr/ppaste.py`${RBUFFER}"
    CURSOR=$CURSOR
    zle -R -c
}
zle -N p-paste
alias zz="z ~"
alias bytmux="byobu-tmux"
alias fk="fuck"
alias pretty-time="/home/man/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pretty-time-zsh.git/pretty-time.zsh"
alias pyls="ls *.py|percol|xargs python3"
alias xx="exit"
alias xmo="xmodmap ~/xmo; setxkbmap -option altwin:alt_super_win -option shift:both_shiftlock; xmodmap ~/xmo;"
alias cpf='copyfile'
alias cpd='copydir'
eval infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' | tic -
export GHUB="https://github.com"
export TUL="tulanthoar"
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="~/golang"
export PATH="$PATH:$GOPATH/bin"
alias pycharm="cd $HOME/apps/pycharm/bin && ./pycharm.sh"

function fpp_pipe() {
    eval '`echo "$BUFFER"`|fpp'
    BUFFER=''
    zle -R -c               # refresh
}
zle -N fpp_pipe

function yank_pipe() {
    LBUFFER="$BUFFER |yank"
    zle -R -c               # refresh
    /home/man/PycharmProjects/tldr/press_return.py
}
zle -N yank_pipe

function exists { which $1 &> /dev/null }
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N percol_select_history
fi
bindkey "^[c" yank_pipe
bindkey '^[p' fpp_pipe
bindkey '^[h' percol_select_history
bindkey '^[v' p-paste
bindkey "^[f" forward-word
bindkey "^[b" backward-word
function BKEYS() {
  bindkey -rM viins "^[";
  bindkey -M viins "\e" vi-cmd-mode;
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M vicmd '\e' sudo-command-line
  bindkey -M vicmd ':' percol_select_history
}
