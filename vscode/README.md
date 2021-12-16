## VScode setup

<blockquote>
  For debugging node: "Javascript Debug Terminal". For go, python etc. check the docs
</blockquote>

- **Enable key repeat with vscode**: [stackoverflow reference](https://stackoverflow.com/questions/39972335/how-do-i-press-and-hold-a-key-and-have-it-repeat-in-vscode)

```shell
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# then restart vscode
```

Going through the keybindings and settings json should be enough but adding some info here:

**leader** is `<spacebar>`

- `<leader> [` previous tab
- `<leader> ]` next tab
- `<leader> v` split editor
- `<leader> e` toggle sidebar visibility
- `<leader> l` run prettier on current file
- Toggle terminal: `ctrl+t`
- Remap capslock to control: [link](https://dev.to/andy4thehuynh/vim-tip-remap-caps-lock-to-control-3ih8)

- Remember to setup the snippets! -> [docs](https://code.visualstudio.com/docs/editor/userdefinedsnippets#:~:text=In%20Visual%20Studio%20Code%2C%20snippets,Snippet%20in%20the%20Command%20Palette.&text=tabCompletion%22%3A%20%22on%22%20%2C,Tab%20to%20insert%20a%20snippet.)
- Ensure that your keyboard settings are at fast (system preferences)

<p align="center"> <img src="https://user-images.githubusercontent.com/22555088/139585698-956a4554-1fac-4dba-867d-4d6a1508b1ab.png" height=400 width=380>  </p>

## Debugger

- Remember to add setup debug auto attach: [docs](https://code.visualstudio.com/docs/nodejs/nodejs-debugging)
<blockquote>
Repl is present in Debug Console (very useful)
</blockquote>

| Mappings (normal mode) | Action                                   |
| ---------------------- | ---------------------------------------- |
| `<Leader-ds>`          | debugger start                           |
| `<Leader-de>`          | debugger end                             |
| `<Leader-dc>`          | debugger continue                        |
| `<Leader-dt>`          | toggle break point                       |
| `<Leader-dT>`          | clear break points                       |
| `<Leader-da>`          | attach to process to debug               |
| `<Leader-drc>`         | Run to cursor                            |
| `<Leader-j>`           | Open javascript debug terminal           |
| `<leader> f`           | vim easy motion (find beginning of word) |
| `,`                    | vim easy motion (find char)              |
