# Use Starship for prompt decoration (https://starship.rs/)
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(thefuck --alias)"

# Load custom env variables
source ~/dotfiles/dotfiles/env.zsh

# Load secrets
source ~/dotfiles/dotfiles/secrets.zsh

# Load custom aliases
source ~/dotfiles/dotfiles/alias.zsh

# Load copied oh-my-zsh plugin jump
source ~/dotfiles/dotfiles/tools/jump.zsh

# Load a reminder script that nvm is no longer used
source ~/dotfiles/dotfiles/tools/nvm.zsh

source ~/dotfiles/dotfiles/tools/thefuck.zsh

# Load alias to convert branch name in correct gh pr create
source ~/dotfiles/dotfiles/tools/ghpr.zsh

# load remove-ds-store-file
source ~/dotfiles/dotfiles/tools/remove-ds-store-files.zsh

# Launch gpg agent
gpgconf --launch gpg-agent

# Add syntax highlighting for commands (https://github.com/zsh-users/zsh-syntax-highlighting)
local HOMEBREW_PREFIX="$(brew shellenv | grep HOMEBREW_PREFIX | awk '{print $2}' FS='"')"
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

