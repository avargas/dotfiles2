DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm ~/.bashrc || true
rm ~/.gitconfig || true
rm ~/.profile || true

ln -s "$DIR/bashrc" ~/.bashrc
ln -s "$DIR/gitconfig.ini" ~/.gitconfig
ln -s "$DIR/profile" ~/.profile
