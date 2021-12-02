# my nvim/zsh/fzf... configuration

## Install Neovim

- Download Nvim

```shell
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
```

- add execute permission

```shell
chmod +x nvim
```

- move to system bin

```shell
sudo chown root:root nvim
sudo mv nvim /usr/bin/vim
```

## Install node.js

```shell
sudo -i
curl -sL install-node.now.sh/lts | bash
```

To speed up the download. Try to use image server of taobao

```shell
npm config set registry https://registry.npm.taobao.org
# check configuration
npm config get registry
# restore official server
npm config set registry https://registry.npmjs.org
```

## Add python support

```shell
# set pip's source to Tsinghua
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# Add python support
python3 -m pip install pynvim
```

## Clone configuration files

```shell
cd ~/.config
git clone https://github.com/ArtisticZhao/nvim
```

The plug will auto install!

## Dependencies

### Plugins dependencies

- [Ag](https://github.com/ggreer/the_silver_searcher)
- figlet
  ```
  sudo apt install figlet
  ```
- xclip
  ```
  sudo apt install xclip
  ```
- [g3kb-switch](https://github.com/lyokha/g3kb-switch)
  ```
  sudo apt-get install libglib2.0-dev
  git clone https://github.com/lyokha/g3kb-switch.git
  cd g3kb-switch
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
  sudo make install
  ```


### C-language  

- [ccls](https://github.com/MaskRay/ccls/wiki)  
This is a language server for c/c++  
Follow the Build and Install.
- [compiledb](https://github.com/nickdiego/compiledb)

## Question Records

### Checkout the output of coc.nvim

```shell
:CoCCommand workplace.showOutput
```

### E117: Unknown function: SemshiBufWipeout

```shell
$ python3 -m pip install pynvim
:UpdateRemotePlugins
```

### “coc.nvim javascript bundle not found running call coc#util#install()”

```shell
cd ~/.vim/plugged/coc.nvim/
npm install
```

### MarkdownPreview not work

When install the markdown-preview.nvim plugin, the plugin will call `mkdp#util#install()` to install independents via curl from github.  
So it need use the proxy.
```
# install markdown-preview.nvim independents manually
p vim
:call mkdp#util#install()
```
