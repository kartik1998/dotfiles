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
| `<C-t>`             | toggle terminal                                    |
| `<C-v>`             | open in vertical split                             |
| `<C-h>`             | open in horizontal split                           |
| `<Leader-b>`        | List all buffers via telescope                     |
| `<Leader-[>`        | previous buffer :bprev                             |
| `<Leader-]>`        | next buffer :bnext                                 |
| `<C-p>`             | fuzzy search filenames                             |
| `<C-f>`             | fuzzy search words in current directory            |
| `<C-n>`             | Select same word as multiple cursors               |
| `<Leader-m>`        | maximize window                                    |
| `<Leader>gst`       | git status                                         |
| `gd`                | go to definition                                   |
| `gc`                | comment visual selection                           |
| `gcc`               | comment a line                                     |

### Vim references

- [daniel miessler](https://danielmiessler.com/study/vim/)
- [key bindings list](https://hea-www.harvard.edu/~fine/Tech/vi.html)
