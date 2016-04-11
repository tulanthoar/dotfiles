function fpp_pipe() {
    eval '`echo "$BUFFER"`|fpp'
    BUFFER=''
    zle -R -c               # refresh
}
zle -N fpp_pipe
function yank_pipe() {
    LBUFFER="$BUFFER |yank"
    zle -R -c               # refresh
    ~/PycharmProjects/tldr/press_return.py
}
function exists { which $1 &> /dev/null }
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
fi
function copydir {
  emulate -L zsh
  print -n $PWD | clipcopy
}
function copyfile {
  emulate -L zsh
  clipcopy $1
}
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
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
    RBUFFER="`python3 ~/PycharmProjects/tldr/ppaste.py`${RBUFFER}"
    CURSOR=$CURSOR
    zle -R -c
}
if [[ -z $commands[thefuck] ]]; then
echo 'no fuck installed';
else;
# Register alias
eval "$(thefuck --alias)"

fuck-command-line() {
    local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
    [[ -z $FUCK ]] && echo -n -e "\a" && return
    BUFFER=$FUCK
    zle end-of-line
}
zle -N fuck-command-line
fi
zle -N p-paste
zle -N yank_pipe
zle -N percol_select_history
zle -N sudo-command-line

alias zz="z ~"
alias bytmux="byobu-tmux"
alias fk="fuck"
alias pretty-time="/home/man/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pretty-time-zsh.git/pretty-time.zsh"
alias pyls="ls *.py|percol|xargs python3"
alias xx="exit"
alias xmo="xmodmap ~/xmo; setxkbmap -option altwin:alt_super_win -option shift:both_shiftlock; xmodmap ~/xmo;"
alias cpf='copyfile'
alias cpd='copydir'
alias pycharm="cd $HOME/apps/pycharm/bin && ./pycharm.sh"
eval infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' | tic - #make ^H work [nvim]
export GHUB="https://github.com"
export TUL="tulanthoar"
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="~/golang"
export PATH="$PATH:$GOPATH/bin"

bindkey -M viins "^[ " autosuggest-execute
bindkey -M viins "^[[A" history-substring-search-up
bindkey -M viins "^[[B" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down
bindkey -M viins "^[c" yank_pipe
bindkey -M viins "^[p" fpp_pipe
bindkey -M viins "^[h" anyframe-widget-execute-history
bindkey -M viins "^[v" p-paste
bindkey -M viins "^[f" forward-word
bindkey -M viins "^[b" backward-word
bindkey -M viins "^[q" anyframe-widget-kill
function BKEYS() {
  bindkey -rM viins "^[";
  bindkey -M viins "\e" vi-cmd-mode;
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M vicmd "\e" sudo-command-line
  bindkey -M vicmd "\t" fuck-command-line
  bindkey -M vicmd ":" percol_select_history
}

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias whereami=display_info

alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
# if is-at-least 4.2.0; then
  # open browser on urls
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=mplayer ; done

  #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
# fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

