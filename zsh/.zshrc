# Environment
source ~/.zsh/zshenv

# Starship prompt
eval "$(starship init zsh)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Oh-my-zsh snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# zprezto directory module
zstyle ':prezto:module:directory:alias' skip 'yes'
zinit snippet PZT::modules/directory/init.zsh

# zprezto editor module
zstyle ':prezto:module:editor' wordchars ''
zstyle ':prezto:module:editor' dot-expansion 'yes'
zinit snippet PZT::modules/editor/init.zsh

# zprezto completion module
zinit snippet PZT::modules/completion/init.zsh

# Add in zsh plugins (order is important)
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^[w' kill-region
bindkey '[5~' history-search-backward # PgUp
bindkey '[6~' history-search-forward  # PgDn
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey  "^[[H" beginning-of-line
bindkey  "^[[F" end-of-line

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
# setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt clobber

# Completion styling
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fast-syntax-highlighting theme
fast-theme -q XDG:catppuccin-frappe

# Aliases
source ~/.zsh/zsh.alias

# Export kitty TERM environment when using SSH
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"


# source zellij and niri
# source <(zellij setup --generate-completion zsh)
source <(niri completions zsh)
