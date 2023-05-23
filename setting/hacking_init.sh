#!/bin/sh

# setting pwntools
echo "Setting pwntools"
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# setting dir
mkdir ~/tools

# setting one_gadget
echo "Setting one_gadget"
git clone https://github.com/david942j/one_gadget.git ~/tools/one_gadget
cd ~/tools/one_gadget
gem install one_gadget

# setting checksec
echo "Setting checksec"
git clone https://github.com/slimm609/checksec.sh.git ~/tools/checksec.sh
cd ~/tools/checksec.sh
cp checksec /usr/local/bin

# setting patchelf
echo "Setting patchelf"
git clone https://github.com/NixOS/patchelf.git ~/tools/patchelf
cd ~/tools/patchelf
./bootstrap.sh && ./configure && make && make check && make install

# setting pwndbg
echo "Setting pwndbg"
git clone https://github.com/pwndbg/pwndbg ~/tools/pwndbg
cd ~/tools/pwndbg
./setup.sh
echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc
echo "export PYTHONIOENCODING=UTF-8" >> ~/.zshrc