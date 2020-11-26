# Setup Instructions
1. Install git
2. Install zsh
2. clone repository
3. run install.sh : `bash install.sh`

# VIM config
The vim config is made for working both in vim and neovim.

Although neovim is targetted for primary support.

## Shortcuts
Although reading through init.vim might be enough, some are listed for completeness

Leader is \

### General
* F8: NERDTreeToggle
* F9: TagbarToggle
* gp: visually select last used block
* Control-Up/Down: Move lines/block up/down
* Leader-q: disable highlights
* Control-ww: Move between windows
* Control-w[Arrow/hjkl]: Move between windows directionally

### Motion
* Leader-Leader-s[b]: Search for character [b] in both directions
* Leader-Leader-f[b]: Search for character [b] forwards
* Leader-Leader-w: Start general forward find
* Leader-Leader-b: Start general backward find


### Buffers/Tabs
* Leader-b: List all buffers

> Control-v/s/t to open in verticalsplit/horizontalsplit/tab

* Control-e: Toggle last used buffer
* Control-PgUp/Dn: Switch between buffers
* Control-Alt-PgUp/Dn: Switch between tabs

### Comments
* Leader-ci: toggle comments on line/block
* Leader-cc: comment out line/block (warning! will add multiple comments on existing)
* Leader-cu: Uncomment as above

### Surround
b1,b2: surrounding types. eg. ' " [] () {}
* cs[b1][b2]: replace b1 with b2 on selected block. eg. 'asv' -> "asv".

> cs[( adds space after replacing while cs[) does not, prefer the latter

* ys[text-object][b1]: wrap the verb block with b1. eg. ysw[, ys$[

### Ctrl-P
* Control-p: fuzzy search filenames
* Control-y: fuzzy search tags in files

#### Once open
* Enter: open in current window
* Control-v: to open in vertical split
* Control-x: to open in horizontal split
* Control-t: to open in new tab
* Control-o: prompt how to open
* Control-z: select multiple

### Multiple Cursors
* Ctrl-n: Select same word as multiple cursors

### Window Selection (choosewin)
* Leader-w: Select window from open windows


### GIT Workflows

* Leader-M: open ViMagit (:Magit)
* :Gblame : Open Git-blame for current file (fugitive)

