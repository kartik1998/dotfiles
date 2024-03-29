## VIM Cheatsheet

- Quit - `:q`
- Save - `:w`
- Save and Quit - `:wq`
- Don't save and quit - `q!`
- Quit all - `:qa!`

- j - `down`
- k - `up`
- h - `left`
- l - `right`
- Insert mode - `i`

## ESC

- Delete a line - `dd` (dd also copies the deleted line to clipboard which you can paster with p)
- To Delete more than one line - `number of lines dd`
- To Delete line afer cursor - `Shift D` use `Shift C` to delete and come in insert mode. 
- Use `dw` to delete word
- If you want to delete upto a certain character `ct character`
- Undo - `u`
- Redo - `r`
- Go to top of file - `gg`
- Go to last line of file - `Shift G`
- Go up and down code blocks - `Shift { or Shift }`
- To go [down, up, left, right] n lines of code - `n arrow key` eg. `4 arrow key`
- Copy paste Line of Code - (Go to line) - `yy` then pase with `p`
- Insert line below `o`
- Insert line above `O`
- Move to next word `w`
- Move to previous word `b`
- Change a word `cw`
- Use `Shift *` to toggle between instances of where the word is used in the file.
- Use `f character` to go to character
- Use `x` to delete and `number x` to delete number of characters
- Use `~` to change casing of a letter use `number ~` to change mode than one casings.
- `u`: lower case `U` upper case. eg: `guw` converts word to lowercase `gUw` converts word to uppercase
- Use `.` to repeat previous operation
- `<ctrl-o>` consider it as going back in a browser
- `<ctrl-i>` consider it as going ahead in a browser
- `shift J` combines current and line below 
- `dap` delete a paragraph, `das` delete a sentence
- `dip` delete inside paragraph, `dis` delete inside sentence
- `dit` delete inside tag, `das` delte a tag eg: `<p> paragraph </p>`

## Visual Mode
- Press `Shift v` This will allow you to select lines of code by going up and down. And you can copy, paste, delete them easily.
- > - Shift right
- < - Shift left


# Vim Notes from the Primeagen
[The Primeagen](https://www.youtube.com/playlist?list=PLm323Lc7iSW9kRCuzB3J_h7vPjIDedplM)

Notes written in (neo)vim

## Vim Movements P1 - Your First Moves 
https://www.youtube.com/watch?v=nnhqVDIx-go

Don't use your arrow keys!

`j`, `k`,`h`, `l`: down, up, left, right  

`w`, `b`: jump forward by word, jump backwards by word  

`f`, `t`: jump to a letter, jump one before a letter  

`%`: Go to respective parenthesis, brace, etc.  

`Ctrl-d`, `Ctrl-u`: jump down half page, jump up half page  

`{`, `}`: jump up a block, jump down by a block  

`V`: highlight line and enter visual mode  

`P`, `p`: paste up a line, paste down a line  

`U`: Capitalize stuff that's highlighted  

`Ctrl-a`, `ctrl-x`: Increment var, decrement var  

`o`, `O`: Insert newline below current, insert newline above current line (both enter insert mode)  

`I`, `A`: Enter insert mode at first character on a line, enter insert mode at last character in the current line  


## Your first VimRC: How to setup your vim's vimrc
https://www.youtube.com/watch?v=n9k9scbTuvQ

Source or "execute" everything in a file with `source %`.  
This applies changes made to .vimrc.  

Make sure to create the undodir at `~/.vim/undodir`  

Run the following command to install the plug vim plugin manager
```console
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open up the .vimrc and add in your plugins.
Then source the .vim with `:source %s`.
Then install plugins with `:PlugInstall`.

Make YCM work:
```console
$ cd ~/.vim/plugged/YouCompleteMe
$ python3 install.py
```

Add some nice remap to make things easier:
* `<leader>h`: Move to window on the left
* `<leader>l`: Move to window on the right
* `<leader>j`: Move to window on the bottom
* `<leader>k`: Move to window on the top

* `<leader>u`: Show undo tree

* `<leader>pv`: Open up file tree

* `<leader>ps`: (Project Search) searches for stuff using ripgrep (Make sure to install ripgrep on your system)

* `<leader>gd`: Go to definition
* `<leader>gr`: Go to references  

## VIM Movements P2: 5 moves to make you better ked
https://www.youtube.com/watch?v=QN4fuSsWTbA

* Use Ctrl-c or Ctrl-open bracket instead of Esc.  
  Instead of using the CAPS LOCK key for Esc, you can use it for CTRL.

* When using f and t, you can use `,` to go backwards and `;` to go forwards to search for the same letter without repeating the same command
* Use `c` instead of `d` to enter insert mode
* You can use `i` and `a` in conjunction with c or d to remove whatever's inside {}, [], "", '', etc.
  E.g. ci" will delete everything within the following string: "Hello, world".
  ca" will delete everything inside the string as well as the "". 
* Marks allow jumping to points in a file: `mJ` will create a mark called J. `'J` will jump to the mark. Note: Capital letter are marks that are unique across multiple files while lowercase letters are for local file marks.
* Bonus remap allows you to move highlighted regions up or down:
``` {.vimscript}
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
```

## Using Vim: Vim + Git - Fugitive
https://www.youtube.com/watch?v=PO6DxfGPQvw

`<leader>gs`: Git Status  

Use `s` to stage and `u` to unstage.  

`:Gcommit`: Commits stuff  

`:Gpush`: Pushes stuff  

`:Git merge <branchname>`: Merge  

Use `dv` on the file you want to resolve if you have merge conflicts.  
The window on the left should be the current branch, the window on the right should be the one you just merged from, and the middle window is the resulting merge.    

`<leader>gf`: Grab from the window on the left (Use 'gu' if using dvorak)  

`<leader>gj`: Grab from the window on the right (Use 'gh' if using dvorak)  

`Ctrl-w` and `ctrl-O`: save and close  

## Making Vim Amazing - Why use Vim and the .vimrc
https://www.youtube.com/watch?v=Iid1Ms14Om4

Why Vim?
* Fast: Doesn't take forever to load files
* Autocomplete
* Able to jump to definitions fast

## Vimium: Intro to using keyboard in your browser
https://www.youtube.com/watch?v=cA2aUFsSLac

`j` and `k`: down and up  

`d`, `u`: half-page down, half-page up (you don't need ctrl)  

`f`: open link in current tab  

`H`: go back  

`V`: Visual mode highlight entire line  

`y`: yank  

## Using Vim: My Vim Workflow - Solving a bug
https://www.youtube.com/watch?v=-I1b8BINyEw

### First you want some plugins

* Gruvbox: "The greatest colorscheme ever bestowed to mankind"
* COC: For autocomplete
* Fzf: File finding

Colorscheme:
```
colorscheme gruvbox
```

Nice remaps for coc and jumping to definition/references:
```
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
```

Fzf remap to make searching for files easier:
```
nnoremap <C-p> :GFiles<CR> 
```

### Commands Used 

`Ctrl-p`: Remap for :GFiles. Use it to search for a file. Works even for searching large codebases.  

`<leader>gd`: Jump to definition  

`Ctrl-^`: Jumps to the last file you were in

`Ctrl-o`: Go back to last position

`Ctrl-i`: Go forward position (Opposite of Ctrl-o)

## VIM: Coolest Vim Command
https://www.youtube.com/watch?v=E7NBhSsZouc

Let's say you have a line of code:
```javascript
const res = await fetch("http://localhost:8002", {
```
If you wanted to change the `http://localhost:8002` string inside the quotes,
you don't have to use `f"` to go to the quotes, you can just use `ci"`. Vim automatically jumps to the nearest quote.

## Vim "g" Command
https://www.youtube.com/watch?v=CN8p9iL7PPI

`g Ctrl-g`: Shows you what line, column, word, and byte you're at and how far you're down the file

`g8`: Get ASCII Code of current character

`g<`: Get the output from the last command you executed

`g&`: Replay your last s command (substitution)

`gJ`: Combines the line below with the current line while keeping the spacing the same

`gU motion`: Uppercase stuff

`gu motion`: Lowercase stuff

`gd`: Jump to definition in the file (or function?)

`gf`: Jumps to a file

`gF`: Jump to a line in a file

`gq`: Automatically align text to 80 characters

`gQ`: Enter Ex mode

`8g_`: Jumps down *7* lines and puts you at the end of that line

`g\$`: In wrap mode go to the end of the "line"

`g??`: Rot13 on a line

`gg`: To Top

`G`: Bottom

`gv`: Rehighlight what you previously highlighted

`gi`: Go back to your previous insert spot

`'<,'>g/Styled/d`: Delete all lines with "Styled"

`'<,'>g/Styled/norm! diw`: Execute diw on every line with "Styled"

`:help g`: A bunch more g commands

`help :g`: All the fun searching g commands

