# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Go
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Write environment specific setting in ~/.zprofile.env
source ~/.zprofile.env
