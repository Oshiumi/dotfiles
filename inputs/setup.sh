[[ -e '/Library/Keyboard Layouts/ProgrammerDvorak.bundle' ]] && exit 0
set -eux
listing=$(hdiutil attach ./inputs/ProgrammerDvorak.dmg | grep Volumes)
volume=$(echo "$listing" | cut -f 3)
[[ ! -e '/Library/Keyboard Layouts' ]] && sudo mkdir -p '/Library/Keyboard Layouts'
sudo cp -rf $volume/ProgrammerDvorak.bundle '/Library/Keyboard Layouts/'
hdiutil detach $volume
exit 0
