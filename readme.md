<p align="center"> <img src = "https://twilio-cms-prod.s3.amazonaws.com/images/7iwai15WuuZ-1YLS6UzvVdC4vtbpjLMIoG8kABoHmrNLML.width-808.png" alt="dotfiles" width=200 height=60> </p>

## Setup Instructions ![](https://img.shields.io/badge/dot-files-blue)

- To setup vim:

```bash
mkdir -p $HOME/.vim/colors
curl -o $HOME/.vim/colors/hybrid.vim https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/colors/hybrid.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o $HOME/.vimrc https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/.vimrc
vi +PlugInstall +qall
```

- Install ripgrep to support live grep: 

```bash
brew install ripgrep #mac
sudo apt-get install ripgrep #ubuntu
```
- To setup neovim:

```bash
git clone git@github.com:kartik1998/dotfiles.git`
cd dotfiles 
# install neovim >= 0.5.1 first
bash neovim_setup.sh
```

# VIM config

The vim config is different for vim and neovim. (Mostly similar) <br/>
Neovim is targeted for main support. 

## Shortcuts

Although reading through init.vim might be enough, some are listed for completeness

Leader is `<spacebar>`

### General

- Leader-e: NERDTreeToggle
- Control-q: To quit buffer / quit vim if number of buffers = 1
- Control-ww: Move between windows
- Control-w[Arrow/hjkl]: Move between windows directionally
- Control-t: toggle terminal
- Control-v: to open in vertical split
- Control-h: to open in horizontal split

### Buffers/Tabs

- Leader-b: List all buffers via telescope
- Leader-[: previous buffer
- Leader-]: next buffer

### Ctrl-P

- Control-p: fuzzy search filenames
- Control-f: fuzzy search words in current directory

### Multiple Cursors | Windows

- Ctrl-n: Select same word as multiple cursors
- Leader-m: maximize window

### Git workflow
- Leader-gst: git status


### Vim references

- [daniel miessler](https://danielmiessler.com/study/vim/)
- [key bindings list](https://hea-www.harvard.edu/~fine/Tech/vi.html)
