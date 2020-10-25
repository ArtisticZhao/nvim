# my nvim/zsh/fzf... configuration

## Install Neovim
- Download Nvim
```
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
```
- add execute permission
```
chmod +x nvim
```
- move to system bin
```
sudo chown root:root nvim
sudo mv nvim /usr/bin
```
## Install node.js
```
sudo -i
curl -sL install-node.now.sh/lts | bash
```
## clone configuration files
```
cd ~/.config
git clone https://github.com/ArtisticZhao/nvim
```
The plug will auto install!

## Question Record
#### E117: Unknown function: SemshiBufWipeout
```
:UpdateRemotePlugins
```
#### “coc.nvim javascript bundle not found running call coc#util#install()”
```
cd ~/.vim/plugged/coc.nvim/
npm install
```
