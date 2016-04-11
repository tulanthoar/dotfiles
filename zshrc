bindkey -v
export EDITOR=nvim
export DUSH=/usr/share
export DUBIN=/usr/bin

export KEYTIMEOUT=3

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
# User configuration
echo $PATH >> $HOME/buffer
source $HOME/dotfiles/myrc.zsh
source $HOME/antigen/antigen.zsh
antigen bundle sindresorhus/pretty-time-zsh
antigen bundle bric3/nice-exit-code
antigen bundle RobSis/zsh-completion-generator
antigen bundle srijanshetty/zsh-pip-completion
antigen use oh-my-zsh
for p (history-substring-search vi-mode tmux thefuck archlinux sudo common-aliases dircycle per-directory-history z colored-man-pages copyfile copydir extract);
  do antigen bundle $p;
done;
source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
BKEYS
alias rm='rm -I'
RPROMPT='$(nice_exit_code)'
