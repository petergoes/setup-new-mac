curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew tap homebrew/cask-fonts    # Contains fira-code
brew tap homebrew/cask-versions # Contains google-chrome-canary

brew install coreutils
brew install curl
brew install libyaml
brew install openssl
brew install wget

# Oh my zsh
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting

# Git and friends
brew install git
brew install diff-so-fancy
brew install gh
brew install git-interactive-rebase-tool
brew install git-lfs
brew install interactive-rebase-tool
brew install tig

# Commit signing (https://withblue.ink/2020/05/17/how-and-why-to-sign-git-commits.html)
brew install gpg
brew install gpgconf
brew install pinentry-mac

# Development environment
brew install deno
brew install nvm
brew install vim

# Tools
brew install exa
brew install ffmpeg
brew install httpie
brew install imagemagic
brew install lynx
brew install thefuck
brew install tldr
brew install tree
brew install watchman

# Passwords
brew install --cask 1password
brew install --cask bitwarden

# Browsers
brew install --cask brave-browser
brew install --cask firefox
brew install --cask firefox-developer-edition
brew install --cask google-chrome-canary
brew install --cask microsoft-edge

# Productivity
brew install --cask alfred
brew install --cask bettertouchtool
brew install --cask busycal
brew install --cask gitify
brew install --cask iterm2
brew install --cask kaleidoscope
brew install --cask runjs
brew install --cask visual-studio-code

# Chat and messaging
brew install --cask discord
brew install --cask microsoft-teams
brew install --cask signal
brew install --cask slack
brew install --cask telegram
brew install --cask whatsapp

# Sound and audio
brew install --cask loopback
brew install --cask soundsource
brew install --cask spotify

# Other
brew install --cask font-fira-code