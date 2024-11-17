# dotfiles

for i (.bash_profile .bashrc .gitconfig .npmrc .profile .psrc .tmux.conf .vimrc .zprofile .zshrc); do ln -svf `pwd`/$i ${HOME}/$i ; done
