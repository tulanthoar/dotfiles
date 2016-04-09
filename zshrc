bindkey -v
export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export DUSH=/usr/share
export DUBIN=/usr/bin
export ZSH_CUSTOM=$HOME/dotfiles/omzsh

export KEYTIMEOUT=3
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"antigen use oh-my-zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
#colorize zsh-syntax-highlighting
#plugins=(history-substring-search vi-mode tmux thefuck archlinux sudo common-aliases dircycle per-directory-history z colored-man-pages copydir copyfile extract)
plugins=()
# User configuration
echo $PATH >> $HOME/buffer
source $HOME/antigen/antigen.zsh
antigen bundle RobSis/zsh-completion-generator
antigen bundle srijanshetty/zsh-pip-completion
antigen use oh-my-zsh
for p (history-substring-search vi-mode tmux thefuck archlinux sudo common-aliases dircycle per-directory-history z colored-man-pages copyfile copydir extract);
  do antigen bundle $p;
done;
antigen apply
source $HOME/dotfiles/myrc.zsh
#source $ZSH/oh-my-zsh.sh
source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
BKEYS

