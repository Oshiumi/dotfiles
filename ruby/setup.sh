# rbenv
brew install rbenv

# Using Homebrew on macOS
brew install ruby-build

# As an rbenv plugin
[[ ! -e "$(rbenv root)"/plugins ]] && mkdir -p "$(rbenv root)"/plugins
[[ ! -e "$(rbenv root)"/plugins/ruby-build ]] && git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

exit 0
