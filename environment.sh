#bin/bash

 snap install spotify
 snap install code

app[0]="git-all"
app[1]="neovim"
app[2]="tmux"
app[3]="tmuxinator"

libs[0]="apt-transport-https"
libs[1]="ca-certificates"
libs[2]="curl"
libs[3]="gnupg-agent"
libs[4]="software-properties-common"

apt install ${libs[*]}

docker[0]="docker-ce"
docker[1]="docker-ce-cli"
docker[2]="containerd.io"

dockerr[0]="docker"
dockerr[1]="docker-engine"
dockerr[2]="docker.io"
dockerr[3]="containerd"
dockerr[4]="runc"

 apt remove ${dockerr[*]}
 apt autoremove

 apt update

 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 apt-key fingerprint 0EBFCD88
 add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"

 apt update
 apt install docker-ce docker-ce-cli containerd.io -y
 curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
 ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


if ! apt install ${app[*]} -y
then 
   echo "UNABLE INSTALL APP"
fi

# INSTALL NVM
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
 
 export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
 nvm install node

# INSTALLL VIM PLUG

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 source ~/.bashrc
 git config --global user.name "Jonathas Rodrigues"
 git config --global user.email "jrc1@ifal.edu.br"


 git --version
 docker version 
 docker-compose --version
 nvim --version
 node --version
 nvm --version
