set -eu

# Install Homebrew
if type brew > /dev/null 2>&1; then
    echo 'Homebrew has already been installed.'
else
    echo 'Install Homebrew'
    set -x
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    set +x
fi

set -x
brew update
set +x

for f in ./*/setup.sh
do
    set -x
    `$f`
    set +x
done

set -x
# emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
[[ ! -e /Applications/Emacs.app ]] && ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

# spacemacs
[[ ! -e ~/.emacs.d ]] && git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# karabiner-elements
brew cask install karabiner-elements

# AquaSKK
brew cask install aquaskk

# iTerm2
brew cask install iterm2

# make links
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    if [[ "$f" =~ \.env$ ]]; then
        [[ ! -e ~/$f ]] && touch ~/$f
        continue
    fi
    if [[ "$f" == ".config" ]]; then
        [[ ! -e ~/.config ]] && mkdir ~/.config
        [[ ! -e ~/.config/karabiner ]] && mkdir ~/.config/karabiner
        [[ ! -e ~/.config/karabiner/karabiner.json ]] && ln -s `pwd`/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
        continue
    fi

    [[ ! -e ~/$f ]] && ln -s `pwd`/$f ~/$f
done

# zsh
sudo echo '/usr/local/bin/zsh' >> /etc/shells
sudo chsh -s /usr/local/bin/zsh
exec $SHELL -l

# Ruby
brew install rbenv
rbenv init
