#!/bin/sh


sudo apt-get install vim tmux zsh -y

# setting vim
echo "Setting vim"

cp vimrc ~/.vimrc

# setting tmux
echo "Setting tmux"

git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/
cp ~/.tmux/.tmux.conf.local ~/

# setting oh my zsh
echo "Setting oh my zsh"

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
chsh -s `which zsh`

# setting fonts
echo "Setting Fonts"
git clone https://github.com/powerline/fonts.git
cd fonts && ./install.sh
cd .. && rm -rf fonts

echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc
echo "export PYTHONIOENCODING=UTF-8" >> ~/.zshrc
