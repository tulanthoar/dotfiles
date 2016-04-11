bindkey -v
export EDITOR=nvim
export KEYTIMEOUT=3

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

source $HOME/dotfiles/myrc.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=',,'
_fzf_compgen_path() {
  ag -g "" "$1"
}
source $HOME/dotfiles/archlinux.plugin.zsh
source $HOME/dotfiles/z/z.sh
source $HOME/dotfiles/colored-man-pages.plugin.zsh
source $HOME/dotfiles/dircycle.plugin.zsh
source $HOME/dotfiles/per-directory-history.zsh
source "$HOME/dotfiles/vi-mode.plugin.zsh"
source $HOME/dotfiles/antigen/antigen.zsh
# antigen bundle tulanthoar/pretty-time-zsh
# antigen bundle RobSis/zsh-completion-generator
# antigen bundle srijanshetty/zsh-pip-completion
antigen bundle bric3/nice-exit-code
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle "$HOME/dotfiles/extract"
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle mollifier/anyframe
zstyle ":anyframe:selector:" use fzf
antigen apply
source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
RPROMPT='$(nice_exit_code)'
alias rm='rm -I'
BKEYS

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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

