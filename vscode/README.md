
## VScode setup 

<blockquote>
  For debugging node: "Javascript Debug Terminal". For go, python etc. check the docs
</blockquote>

* **Enable key repeat with vscode**: [stackoverflow reference](https://stackoverflow.com/questions/39972335/how-do-i-press-and-hold-a-key-and-have-it-repeat-in-vscode)

```shell
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# then restart vscode 
```

Going through the keybindings and settings json should be enough but adding some info here:

**leader** is `<spacebar>`

- `<leader> [` previous editor
- `<leader> ]` next editor
- `<leader> v` split editor
- `<leader> e` toggle sidebar visibility

- Toggle terminal: `cmd w`
- Remap capslock to control: [link](https://dev.to/andy4thehuynh/vim-tip-remap-caps-lock-to-control-3ih8)

- Remember to setup the snippets! -> [docs](https://code.visualstudio.com/docs/editor/userdefinedsnippets#:~:text=In%20Visual%20Studio%20Code%2C%20snippets,Snippet%20in%20the%20Command%20Palette.&text=tabCompletion%22%3A%20%22on%22%20%2C,Tab%20to%20insert%20a%20snippet.)
- Ensure that your keyboard settings are at fast (system preferences)

![image](https://user-images.githubusercontent.com/22555088/139585698-956a4554-1fac-4dba-867d-4d6a1508b1ab.png)
