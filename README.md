# hacking_tools

## docker

해킹을 위한 환경 셋팅이 되어있는 docker image입니다.

- pwnable : ubuntu18.04, ubuntu20.04, ubuntu 22.04
- web : ubuntu20.04

### pwnable installed

- ropgadget
- vim
- tmux
- pwntools
- one gadget
- checksec
- oh my zsh(hogbal.zsh-theme)
- patchelf
- Pwngdb

### web installed

- vim
- tmux
- oh my zsh(hogbal.zsh-theme)
- Flask
- selenium

## setting

리눅스 설정을 편하게 패주는 shell script입니다.(아직 테스트는 안해봄!)

### init.sh

- vim
- tmux
- oh my zsh
- powerlevel10k

### hacking_init.sh

- pwntools
- one_gadget
- checksec
- patchelf
- pwndbg

## server

각종 해킹을 도와주는 서버가 있습니다.

### request

XSS cookie 탈취를 위한 서버

### BaseUri

CSP 우회 - Base uri를 이용해 CSP를 우회할 때 사용하는 서버
