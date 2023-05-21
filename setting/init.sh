#!/bin/sh

# setting vim
echo "Setting vim"

cp vimrc ~/.vimrc

# setting tmux
echo "Setting tmux"

git clone https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/

# setting oh my zsh
echo "Setting oh my zsh"

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

echo './powerlevel10k.zsh-theme' >> ~/.zshrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc
echo "export PYTHONIOENCODING=UTF-8" >> ~/.zshrc
echo "POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true" >> ~/.zshrc