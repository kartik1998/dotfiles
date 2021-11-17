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
