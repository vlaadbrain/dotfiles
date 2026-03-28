sudo pacman -Sy terminus-font
// setfont ter-122b // echo "FONT=ter-122b" >> /etc/vconsole.conf
sudo pacman -Sy linux-headers
sudo pacman -Sy xorg-server xorg-apps nerd-fonts xterm zsh git make gcc openssh stow xclip sddm xorg wget brightnessctl
sudo pacman -Sy neovim bat go git-delta
sudo pacman -Sy bluez bluez-utils bluetui
sudo pacman -Sy mpd mpc ncmpc wiremix
sudo pacman -Sy luarocks
sudo pacman -Sy btop mupdf

git clone https://aur.archlinux.org/yay.git
makepkg -si

curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
makepkg -si 

yay xinit-xsession clangd-bin zen-browser
yay evdi-dkms-git displaylink

sudo pacman -Sy signal-desktop

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install node
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mkdir ~/bin

Makefile: dwm st dmenu dwmstatus tabbed slock 

make && cp -f $BIN ~/bin/

git clone https://github.com/vlaadbrain/dwm.git
git clone https://github.com/vlaadbrain/st.git
git clone https://github.com/vlaadbrain/dmenu.git
git clone https://github.com/vlaadbrain/dwmstatus.git
git clone https://github.com/vlaadbrain/tabbed
git clone https://github.com/vlaadbrain/slock.git 

git clone http://git.suckless.org/slstatus

cargo install eza
cargo install lemurs
cargo install impala
cargo install ast-grep
