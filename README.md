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
sudo mv nvim /usr/bin
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
- figlet `sudo apt install figlet`
- xclip `sudo apt install xclip`

### C-language  

- [ccls](https://github.com/MaskRay/ccls/wiki)  
This is a language server for c/c++  
Follow the Build and Install.
- [compiledb](https://github.com/nickdiego/compiledb)

## Question Record

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

## Keymaps

This table draw with vim-table-mode, it will better present in text mode.

| Category         | Function                                   | KEYMAP             |
|------------------|--------------------------------------------|--------------------|
| Navigation       | Navigation                                 | h j k l            |
|                  | Navigation in i-mode                       | {c-[hjkl]}         |
|                  | Speed Navigation                           | J K                |
|                  | {Home} {End}                               | H L                |
|                  | next/prev word (split by space or ,._=...) | w/b                |
|                  | next/prev WORD (split only with sp)        | W/B                |
|                  | end of word/WORD                           | e/E                |
|                  | jump matchs e.g. { -> }                    | %                  |
|                  | Find backward/forward a char               | f[x]/F[x]          |
|                  | Find next/prev f[x]                        | =/-                |
|------------------|--------------------------------------------|--------------------|
| Folding          | toggle folding                             | za                 |
|                  | open/close folding                         | zo zc              |
|                  | fold all/ unfold all                       | zM zR              |
|                  | toggle fold git diff                       | zg                 |
|------------------|--------------------------------------------|--------------------|
| Insertion        | Insert Mode at cursor                      | i                  |
|                  | Insert Mode at line header                 | I                  |
|                  | Insert Mode after cursor                   | a                  |
|                  | Insert Mode at line tail                   | A                  |
|                  | Insert Mode with new line below            | o                  |
|                  | Insert Mode with new line above            | O                  |
|                  | Insert Mode at insert before               | gi                 |
|------------------|--------------------------------------------|--------------------|
| Edition          | replace a char                             | r                  |
|                  | replace word under cursor                  | {c-h}              |
|                  | search word under cursor (i,n,v-mode)      | {c-f}              |
|                  | Copy to Cilpboard                          | Y                  |
|                  | Paste from Cilpboard                       | P                  |
|                  | indent/indent leftward                     | }/{                |
|                  | Select all                                 | {c-a}              |
|                  | change upper/lowercase                     | `                  |
|                  | add empty row (n-mode)                     | {enter}            |
|                  | replace tab with space                     | {leader}{tab}      |
|------------------|--------------------------------------------|--------------------|
| code navigation  | go to defination                           | gd                 |
|                  | goto/goback defination in ctags            | {c-]} {c-t}        |
|------------------|--------------------------------------------|--------------------|
| Files            | Write file(turn to n-mode when i-mode)     | {c-s}              |
|                  | Quit                                       | {c-q}              |
|                  | Open Config File                           | {leader}rc         |
|                  | Spell Check                                | {leader}sc         |
|                  | Go to file                                 | gf                 |
|------------------|--------------------------------------------|--------------------|
| Split Windows    | split windows to                           | {leader}s[hjkl]    |
|                  | Splited Windows Navigation                 | {leader}[hjkl]     |
|                  | switch splited windows                     | {leader}sr         |
|------------------|--------------------------------------------|--------------------|
| terminal         | toggle terminal                            | {m-t}              |
|                  | kill terminal                              | {c-q}              |
|                  | escape terminal mode to normal             | {c-d}              |
|------------------|--------------------------------------------|--------------------|
| Buffer           | jump buffer X(buffer index)                | {leader}X          |
|------------------|--------------------------------------------|--------------------|
|------------------|--------------------------------------------|--------------------|
| easy align       | Align by = (v-mode muti-lines)             | {leader}ga[=]      |
|                  | align by first space                       | {leader}ga1{space} |
|------------------|--------------------------------------------|--------------------|
| unto tree        | toggle unto tree                           | {leader}ut         |
|------------------|--------------------------------------------|--------------------|
| Table Mode       | toggle table mode                          | {leader}tm         |
| (use '!'         | table header                               | !A!B!C!            |
| represent'\|')   | Dividing line                              | !!(i-mode)         |
|                  | Delete Column                              | {leader}tdc        |
|                  | Insert Column before                       | {leader}tiC        |
|                  | Insert Column after                        | {leader}tic        |
|------------------|--------------------------------------------|--------------------|
| interestingwords | toggle focus on work under cursor          | {leader}k          |
|                  | close all interestingwords                 | {leader}k          |
|------------------|--------------------------------------------|--------------------|
| Nerd-Commenter   | comment                                    | {leader}cc         |
|                  | uncomment                                  | {leader}cu         |
|                  | toggle comment (also work in i-mode)       | {c-/}              |
|------------------|--------------------------------------------|--------------------|
| git              | stage/unstage on coc-explorer              | {{/}}              |
|                  | open lazygit                               | {c-g}              |
|                  | open graph of commit & branch              | {leader}gb         |
|                  | next/prev hunk                             | [h ]h              |
|                  | git fold to only show hunks                | zg                 |
|------------------|--------------------------------------------|--------------------|
| fzf              | search file in current directory           | {c-p}              |
|                  | search content in file                     | {m-f}              |
|                  | search linux kernel doc                    | {F10}              |
|------------------|--------------------------------------------|--------------------|
| easymotion       | m{char}{char}{label}                       |                    |
|                  | fuzzy search & easymotion                  | {leader}/          |
|------------------|--------------------------------------------|--------------------|
| incsearch        | fuzzy search                               | z/ or z?           |
|------------------|--------------------------------------------|--------------------|
| wildfire         | select in "'[(                             | {tab}              |
|------------------|--------------------------------------------|--------------------|
| interestingwords | add interesting word [n-mode, v-mode]      | {leader}i          |
|                  | remove all interestingwords                | {leader}I          |
|------------------|--------------------------------------------|--------------------|
| sandwich         | add sround in v-mode                       | sa{pairs}          |
|                  | add sround with motion                     | eg saiw{pairs}     |
|                  | delete sround                              | sdb/sd{pairs}      |
|                  | replace sround                             | srb{pairs}         |
|                  | replace sround                             | sr{pairs}{pairs}   |
|------------------|--------------------------------------------|--------------------|
| multi-cursor     | select word                                | {c-n}              |
|                  | create cursor                              | {c-up/down}        |
|                  | skip current                               | q                  |
|------------------|--------------------------------------------|--------------------|
| coc-Snippets     | expand or jump to next placeholder         | {c-d}              |
|                  | jump to previous placeholder               | {c-e}              |
|------------------|--------------------------------------------|--------------------|
| coc-translator   | translate                                  | {leader}tr         |
| coc-yank         | yank history                               | {leader}y          |
|------------------|--------------------------------------------|--------------------|
| coc-word         | toggle coc-word enable                     | F3                 |
|------------------|--------------------------------------------|--------------------|
| MarkDown         | paste copyed image                         | {leader}p          |
|------------------|--------------------------------------------|--------------------|
| vimtex           | start compile                              | \ll                |
|                  | show pdf                                   | \lv                |
|                  | stop compile                               | \lk                |
|                  | show logs                                  | \le                |
|                  | clean compiled files                       | \lc                |
|------------------|--------------------------------------------|--------------------|

