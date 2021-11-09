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
- Use `.` to repeat previous operation
- `<ctrl-o>` consider it as going back in a browser
- `<ctrl-i>` consider it as going ahead in a browser

## Visual Mode
- Press `Shift v` This will allow you to select lines of code by going up and down. And you can copy, paste, delete them easily.
