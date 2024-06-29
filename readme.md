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

## Debugger

<p> <img src = "https://raw.githubusercontent.com/kartik1998/dotfiles/master/assets/debugger.png" alt="dotfiles" width=700 height=460> </p>

**vimspector** is used for debugging applications. [docs](https://puremourning.github.io/vimspector-web/demo-setup.html). <br/>
You'll need a `.vimspector.json` file in your project to run the debugger. <br/>
Sample `.vimspector.json`:

```json
{
  "configurations": {
    "run": {
      "adapter": "vscode-node",
      "configuration": {
        "request": "launch",
        "protocol": "auto",
        "stopOnEntry": true,
        "console": "integratedTerminal",
        "program": "${workspaceRoot}/index.js",
        "cwd": "${workspaceRoot}"
      },
      "breakpoints": {
        "exception": {
          "all": "Y",
          "uncaught": "Y"
        }
      }
    }
  }
}
```

| Mappings       | Action             |
| -------------- | ------------------ |
| `<Leader-ds>`  | debugger start     |
| `<Leader-de>`  | debugger end       |
| `<Leader-dc>`  | debugger continue  |
| `<Leader-dr>`  | debugger restart   |
| `<Leader-dt>`  | toggle break point |
| `<Leader-dT>`  | clear break points |
| `<Leader-dk>`  | Step out           |
| `<Leader-dl>`  | Step into          |
| `<Leader-dj>`  | Step over          |
| `<Leader-drc>` | Run to cursor      |

- `.vimspector.json` to attach to a node server:
- run `node --inspect <filename>.js` and start the debugger with `<Leader-ds>`

```json
{
  "configurations": {
    "run": {
      "adapter": "vscode-node",
      "default": true,
      "breakpoints": {
        "exception": {
          "all": "N",
          "uncaught": "N"
        }
      },
      "configuration": {
        "name": "Attaching to a process ID",
        "type": "node",
        "request": "attach",
        "skipFiles": ["node_modules/**/*.js", "<node_internals>/**/*.js"],
        "processId": "${processId}"
      }
    }
  }
}
```

## Clipboard Manager

- [Maccy](https://maccy.app/)
- In preferences set hotkey to `^m`

## Screen Capture Text from Screen to Clipboard (OCR)

- Mac shortcut link - [Screen capture text to clipboard](https://www.icloud.com/shortcuts/fda17e5b8d4c49319a44591a3e4bda74)
- Reference link to see how to setup the shortcut - [youtube-macmost](https://www.youtube.com/watch?v=BZVlifUpr_c)
- Note: Shortcuts app is very buggy and sometimes breaks with releases, `Take screenshot` is currently breaking for macOS sonoma so i've switched to using [grab text](https://github.com/e-kotov/macos-shortcuts?tab=readme-ov-file). Forked repo [macos-shortcuts](https://github.com/kartik1998/macos-shortcuts)
  - Mac shortcut link - [Grab Text via Clipboard Screenshot](https://www.icloud.com/shortcuts/47792fa3950b4aa9a7e287f701705ec3) 

<p> <img src = "https://raw.githubusercontent.com/kartik1998/dotfiles/master/assets/screen_capture.png" alt="dotfiles" width=700 height=460> </p>

## LICENSE

<b>[WTFPL](http://www.wtfpl.net/)</b>
