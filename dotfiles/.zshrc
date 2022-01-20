#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# Use Starship for prompt decoration (https://starship.rs/)
eval "$(starship init zsh)"

# Load custom env variables
source ~/dotfiles/dotfiles/env.zsh

# Load custom aliases
source ~/dotfiles/dotfiles/alias.zsh

# Add syntax highlighting for commands (https://github.com/zsh-users/zsh-syntax-highlighting)
local HOMEBREW_PREFIX="$(brew shellenv | grep HOMEBREW_PREFIX | awk '{print $2}' FS='"')"
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
