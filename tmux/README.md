## tmux

<blockquote>
sudo apt-get update <br/>
sudo apt-get install tmux
</blockquote>

- To enable copying to clipboad in iterm2: `If using iTerm on macOS, goto iTerm2 > Preferences > “General” tab, and in the “Selection” section, check “Applications in terminal may access clipboard”.`
- Reference: [link](https://unix.stackexchange.com/questions/318281/how-to-copy-and-paste-with-a-mouse-with-tmux)

- tmux cheatsheet: https://tmuxcheatsheet.com

| Mappings                 | Action                                            |
| ------------------------ | ------------------------------------------------- |
| `tmux`                   | start tmux                                        |
| `ctrl+w v`               | new pane (vertical split)                         |
| `ctrl+w h`               | new pane (horizontal split)                       |
| `ctrl+w [direction key]` | move between panes                                |
| `ctrl+w c`               | new window                                        |
| `ctrl+w <number>`        | move to window of specific number                 |
| `ctrl+w ,`               | rename window                                     |
| `ctrl+w w`               | view windows (enter to open window and x to kill) |
| `exit`                   | exit window                                       |

## Sessions

| Mappings                                             | Action            |
| ---------------------------------------------------- | ----------------- |
| `tmux ls`                                            | list sessions     |
| `tmux new -s <session-name>`                         | new session       |
| `tmux a -t <session-name or id>`                     | attach to session |
| `tmux rename-session -t <id or name> <renamed name>` | rename session    |
| `tmux kill-session -t <name> `                       | kill session      |
