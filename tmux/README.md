## tmux

<blockquote>
sudo apt-get update
sudo apt-get install tmux
</blockquote>

- tmux cheatsheet: https://tmuxcheatsheet.com

| Mappings                 | Action                                            |
| ------------------------ | ------------------------------------------------- |
| `tmux`                   | start tmux                                        |
| `ctrl+a v`               | new pane (vertical split)                         |
| `ctrl+a h`               | new pane (horizontal split)                       |
| `ctrl+a [direction key]` | move between panes                                |
| `ctrl+a c`               | new window                                        |
| `ctrl+a <number>`        | move to window of specific number                 |
| `ctrl+a ,`               | rename window                                     |
| `ctrl+a w`               | view windows (enter to open window and x to kill) |
| `exit`                   | exit window                                       |

## Sessions

| Mappings                                             | Action            |
| ---------------------------------------------------- | ----------------- |
| `tmux ls`                                            | list sessions     |
| `tmux new -s <session-name>`                         | new session       |
| `tmux a -t <session-name or id>`                     | attach to session |
| `tmux rename-session -t <id or name> <renamed name>` | rename session    |
| `tmux kill-session -t <name> `                       | kill session      |
