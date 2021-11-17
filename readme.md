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

## VIM config

The vim config is different for vim and neovim. (Mostly similar) <br/>
Neovim is targeted for main support. 

## Key bindings

Although reading through init.vim might be enough, some are listed for completeness.
The mappings are fully customizable. Many familiar mapping patterns are setup as defaults.

Leader is `<spacebar>`

| Mappings       | Action                                               |
|----------------|------------------------------------------------------|
| `<Leader-e>`   | NerdTreeToggle                                       |
| `<C-q>`   | To quit buffer / quit vim if number of buffers = 1                                      |
| `<C-ww>`          | Move between windows                     |
| `<C-w[Arrow/hjkl]>`        | Move between windows directionally            |
| `<C-t>`        | toggle terminal          |
| `<C-v>`         | open in vertical split                                   |
| `<C-h>`        |  open in horizontal split                     |
| `<C-v>`        | Go to file selection as a vsplit                     |
| `<Leader-b>`        | List all buffers via telescope                          |
| `<Leader-[>`        | previous buffer :bprev                       |
| `<Leader-]>`        | next buffer :bnext       |
| `<C-p>`            | fuzzy search filenames       |
| `<C-f>`        |   fuzzy search words in current directory                                   |
| `<C-n>`        | Select same word as multiple cursors                    |
| `<Leader-m>`        | maximize window         |
| `<Leader>gst`      | git status        |

