#!/bin/bash
# virtualbox


# Leia e instale libs do arquivo libs.txt 
# Read and install libs from the libs.txt file
cat ./libs.txt | while read libs; do
    apt install $libs
done

# Leia e instale aplicaticos do arquivo app.txt
# Read and install aplicativos from the app.txt file
cat ./app.txt | while read app; do
    apt install $app
done


# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"


# Install  spotify
CURL -Ss HTTPS://DOWNLOAD.SPOTIFY.COM/DEBIAN/PUBKEY.GPG | SUDO APT-KEY ADD - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list


# Install PYENV
curl https://pyenv.run | bash

# Install Docker Engine
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 apt-key fingerprint 0EBFCD88
 add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"

apt update
apt install docker-ce docker-ce-cli containerd.io -y

# Install Docker Compose
 curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
 ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


# Install NVM
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
 
 export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
 nvm install node


# InstallL Vim Plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 source ~/.bashrc

exec $SHELL
 git --version
 docker version 
 docker-compose --version
 nvim --version
 node --version
 nvm --version
