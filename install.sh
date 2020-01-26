# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install git

# emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus

# git
sh ./git/setup.sh
