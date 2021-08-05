apt-get update
apt-get upgrade -y
apt install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

nvm_default_install_dir() {
  [ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm"
}

# install nvm 
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
if ! [ -d "${HOME}/.nvm/.git" ]; then
    echo "安装nvm"
    source ~/.zshrc
fi

# check nvm add nvm command to .zshrc

# install node 
nvm install --lts
# install yarn
npm i -g npm
npm install -g yarn
# install google's tool https://github.com/google/zx
# yarn global add zx
