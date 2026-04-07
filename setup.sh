# Sets up a development environment in a linux distro (currently ubuntu/debian)

#!\bin\bash
echo "Updating System"
sudo apt update && sudo apt upgrade -y
sudo apt install git curl build-essential default-jdk flatpak python3-venv -y

echo "Configuring Git"
git config --global user.name "Avraneel Pal"
git config --global user.email avraneelpal22@gmail.com
git config --global init.defaultBranch main
git config --global core.editor "code --wait"

echo "Setting up NodeJS via nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
# Loading nvm in the same shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Installing latest lts version
nvm install --lts

# echo "Setting up Flathub..."
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.keepassxc.KeePassXC

echo "Setup completed succesfully"
