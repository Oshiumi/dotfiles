[[ -e '/Library/Keyboard Layouts/ProgrammerDvorak.bundle' ]] && exit 0
set -eux
listing=$(hdiutil attach ProgrammerDvorak.dmg | grep Volumes)
volume=$(echo "$listing" | cut -f 3)
cp -rf $volume/ProgrammerDvorak.bundle '/Library/Keyboard Layouts/'
hdiutil detach $volume
