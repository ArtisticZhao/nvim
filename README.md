# my nvim configuration

## Install Neovim
- Download Nvim
```
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
```
- 添加权限
```
chmod +x nvim
```

- 移动到系统路径
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

## Q&A
#### E117: Unknown function: SemshiBufWipeout
```
:UpdateRemotePlugins
```
#### “coc.nvim javascript bundle not found running call coc#util#install()”
```
cd ~/.vim/plugged/coc.nvim/
npm install
```
