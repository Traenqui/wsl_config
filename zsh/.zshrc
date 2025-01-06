# Load functions
if [ -f "$ZDOTDIR/zsh-functions" ]; then
	source "$ZDOTDIR/zsh-functions"
fi	

# Source files
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-options"
zsh_add_file "zsh-exports"

# Load plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "jeffreytse/zsh-vi-mode"

# history
HISTSIZE=110000
SAVEHIST=100000
HISTFILE=~/.histfile

eval "$(mise activate zsh)"
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.toml)"

[ -f "/home/traenqui/.ghcup/env" ] && source "/home/traenqui/.ghcup/env" # ghcup-env

eval "$(zoxide init zsh)"
