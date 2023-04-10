FROM ubuntu:20.04
MAINTAINER hogbal31@gmail.com

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install net-tools -y && \
	apt-get install openssh-server -y && \
	apt-get install vim -y && \
	apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y && \
	apt-get install ruby -y && \
	apt-get install zsh -y && \
	apt-get install fonts-powerline -y && \
	apt-get install language-pack-en -y && \
	apt-get install gdb -y && \
	apt-get install tmux -y && \
	update-locale

RUN pip3 install Flask selenium

#install vim
COPY vimrc /root/.vimrc

#install tmux
WORKDIR /root
RUN git clone https://github.com/gpakosz/.tmux.git
RUN ln -s -f .tmux/.tmux.conf
RUN cp .tmux/.tmux.conf.local .

#install oh my zsh
WORKDIR /root
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
	git clone https://github.com/zsh-users/zsh-autosuggestions  /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
	sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' /root/.zshrc
RUN git clone https://github.com/hogbal/hogbal.zsh-theme.git
WORKDIR hogbal.zsh-theme
RUN sh install.sh
RUN chsh -s /usr/bin/zsh | echo 'root'

CMD ["/usr/bin/zsh"]