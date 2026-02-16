<p align="center"> <img src = "https://twilio-cms-prod.s3.amazonaws.com/images/7iwai15WuuZ-1YLS6UzvVdC4vtbpjLMIoG8kABoHmrNLML.width-808.png" alt="dotfiles" width=200 height=60> </p>

## Setup Instructions ![](https://img.shields.io/badge/dot-files-blue)

- To setup vim:

```bash
bash <(curl -s https://raw.githubusercontent.com/kartik1998/dotfiles/master/scripts/vim-setup.sh)
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

- Tmux conf:

```bash
curl -o ~/.tmux.conf https://raw.githubusercontent.com/kartik1998/dotfiles/master/tmux/tmux.conf

```

## VIM config

The vim config is different for vim and neovim. (Mostly similar) <br/>
Neovim is targeted for main support.

## Key bindings

Although reading through init.vim might be enough, some are listed for completeness.
The mappings are fully customizable. Many familiar mapping patterns are setup as defaults.

Leader is `<spacebar>`

| Mappings            | Action                                             |
| ------------------- | -------------------------------------------------- |
| `<Leader-e>`        | NerdTreeToggle                                     |
| `<C-q>`             | To quit buffer / quit vim if number of buffers = 1 |
| `<C-ww>`            | Move between windows                               |
| `<C-w[Arrow/hjkl]>` | Move between windows directionally                 |
| `<C-t>`             | toggle terminal `(doesn't work for vim)`           |
| `<Leader-v>`        | open in vertical split                             |
| `<Leader-h>`        | open in horizontal split                           |
| `<Leader-b>`        | List all buffers via telescope                     |
| `<Leader-l>`        | Prettify file                                      |
| `<Leader-[>`        | previous buffer :bprev                             |
| `<Leader-]>`        | next buffer :bnext                                 |
| `<C-p>`             | fuzzy search filenames                             |
| `<C-f>`             | fuzzy search words in current directory            |
| `<C-g>b`            | Telescope git_branches                             |
| `<C-g>log`          | Telescope git_commits                              |
| `<C-g>st`           | Telescope git_status                               |
| `<leader-st>`       | Telescope git_stash                                |
| `<C-n>`             | Select same word as multiple cursors               |
| `<C-m>`             | maximize window                                    |
| `<leader-m>`        | Vimmagit                                           |
| `gd`                | go to definition                                   |
| `gc`                | comment visual selection                           |
| `gcc`               | comment a line                                     |
| `<C-u>`             | page up                                            |
| `<C-d>`             | pade down                                          |
| `<leader> f`        | vim easy motion (find beginning of word)           |
| `,`                 | vim easy motion (find char)                        |

## Debugger (deprecated)

> **vimspector** has been removed to improve startup performance (~2.5s savings). If you need it, check the git history for the last commit that included vimspector config and keybindings.

## Clipboard Manager

- [Maccy](https://maccy.app/)
- In preferences set hotkey to `^m`

## Screen Capture Text from Screen to Clipboard (OCR)

- Mac shortcut link - [Screen capture text to clipboard](https://www.icloud.com/shortcuts/fda17e5b8d4c49319a44591a3e4bda74) [Breaks for MacOS Sonoma, try the link below the note for MacOS Sonoma]
- Reference link to see how to setup the shortcut - [youtube-macmost](https://www.youtube.com/watch?v=BZVlifUpr_c)  
- Note: Shortcuts app is very buggy and sometimes breaks with releases, `Take screenshot` is currently breaking for macOS sonoma so i've switched to using [grab text](https://github.com/e-kotov/macos-shortcuts?tab=readme-ov-file). Forked repo [macos-shortcuts](https://github.com/kartik1998/macos-shortcuts)
  - Mac shortcut link - [Grab Text via Clipboard Screenshot](https://www.icloud.com/shortcuts/f2cd72d62f154de7af74f0738f718fb7) 

<p> <img src = "https://raw.githubusercontent.com/kartik1998/dotfiles/master/assets/screen_capture.png" alt="dotfiles" width=700 height=460> </p>

## LICENSE

<b>[WTFPL](http://www.wtfpl.net/)</b>
