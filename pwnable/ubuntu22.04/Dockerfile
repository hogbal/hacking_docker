FROM ubuntu:22.04
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
	apt-get install file -y && \
	apt-get install dh-autoreconf -y && \
	apt install gcc ruby-dev -y && \
	gem install seccomp-tools && \
	pip3 install ropgadget && \
	update-locale

#install vim
COPY vimrc /root/.vimrc

#install tmux
WORKDIR /root
RUN git clone https://github.com/gpakosz/.tmux.git
RUN ln -s -f .tmux/.tmux.conf
RUN cp .tmux/.tmux.conf.local .

#install pwntools
WORKDIR /root
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade pwntools

#install one_gadget
WORKDIR /root
RUN git clone https://github.com/david942j/one_gadget.git /root/one_gadget
WORKDIR /root/one_gadget
RUN gem install one_gadget

#install checksec
WORKDIR /root
RUN git clone https://github.com/slimm609/checksec.sh.git
RUN cp checksec.sh/checksec /usr/local/bin

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

#install patchelf
WORKDIR /root
RUN git clone https://github.com/NixOS/patchelf.git
WORKDIR patchelf
RUN ./bootstrap.sh && \
	./configure && \
	make && \
	make check && \
	make install

#install pwndbg
WORKDIR /root
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR pwndbg
RUN ./setup.sh
RUN echo "export LC_ALL=en_US.UTF-8" >> /root/.zshrc
RUN echo "export PYTHONIOENCODING=UTF-8" >> /root/.zshrc

CMD ["/usr/bin/zsh"]