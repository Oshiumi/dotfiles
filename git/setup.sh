GIT_CONFIG_LOCAL=~/.gitconfig.local
if [ ! -e $GIT_CONFIG_LOCAL ]; then
    touch $GIT_CONFIG_LOCAL
    echo -n "git config user.email?> "
    read GIT_AUTHOR_EMAIL

    echo -n "git config user.name?> "
    read GIT_AUTHOR_NAME

    cat <<EOF > $GIT_CONFIG_LOCAL
[user]
  name = $GIT_AUTHOR_NAME
  email = $GIT_AUTHOR_EMAIL
EOF
fi
