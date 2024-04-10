# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zsh_add_plugin "romkatv/powerlevel10k"

autoload -Uz compinit
compinit

# history
HISTSIZE=110000
SAVEHIST=100000
HISTFILE=~/.histfile

eval "$(mise activate zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[ -f "/home/traenqui/.ghcup/env" ] && source "/home/traenqui/.ghcup/env" # ghcup-env

# run pls on startup 
pls

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
