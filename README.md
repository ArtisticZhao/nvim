# my nvim/zsh/fzf... configuration

## Install Neovim
- Download Nvim
```
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
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

To speed up the download. Try to use image server of taobao
```
npm config set registry https://registry.npm.taobao.org
# check configuration
npm config get registry
# restore official server
npm config set registry https://registry.npmjs.org
```

## Add python support
```
python3 -m pip install pynvim
```

## Clone configuration files
```
cd ~/.config
git clone https://github.com/ArtisticZhao/nvim
```

The plug will auto install!

## Dependencies

### Plugins dependencies
- [Ag](https://github.com/ggreer/the_silver_searcher)
- figlet `sudo apt install figlet`

### C-language  

- [ccls](https://github.com/MaskRay/ccls/wiki)  
This is a language server for c/c++  
Follow the Build and Install.
- [compiledb](https://github.com/nickdiego/compiledb)

## Question Record
#### Checkout the output of coc.nvim
```
:CoCCommand workplace.showOutput
```

#### E117: Unknown function: SemshiBufWipeout
```
$ python3 -m pip install pynvim
:UpdateRemotePlugins
```
#### “coc.nvim javascript bundle not found running call coc#util#install()”
```
cd ~/.vim/plugged/coc.nvim/
npm install
```
