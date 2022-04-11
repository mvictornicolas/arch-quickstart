cp ~/.config/i3/config ~/.config/i3/config.bkp

sudo pacman -Syu
sudo pacman -S flatpak
sudo pacman -S snap
sudo pacman -S firefox
sudo pacman -S ranger
sudo pacman -S qutebrowser
sudo pacman -S copyq
sudo pacman -S docker
sudo pacman -S dunst
sudo pacman -S playerctl
sudo pacman -S gnome-clocks
sudo pacman -S pulseeffects
sudo pacman -S pulseaudio
sudo pacman -S pavucontrol
sudo pacman -S guake
sudo pacman -S gnome-calendar
sudo pacman -S alsa-lib alsa-utils 

sudo pacman-key --init
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Sy
sudo pacman -S --needed base-devel git wget yajl
sudo pacman -S yay
yay -S pamac-aur

yay -S --noconfirm zsh-theme-powerlevel10k-git

echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
p10k configure

flatpak install chrome
flatpak install dbeaver
flatpak install teams
flatpak install anydesk
flatpak install obsidian

yay -S --noconfirm --needed snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo pacman -S gnome-keyring libsecret libgnome-keyring
sudo snap install code --classic


echo "Enable tab sleeping on chrome for RAM saving at chrome://flags#freeze"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
