# fzf

Generates shell snippets that add Noctalia colors to `FZF_DEFAULT_OPTS`.

Enable the appropriate **fzf** entries in **Noctalia Settings -> Templates**:

- Bash: `$XDG_CONFIG_HOME/fzf/themes/noctalia.sh`
- Fish: `$XDG_CONFIG_HOME/fzf/themes/noctalia.fish`

`$XDG_CONFIG_HOME` defaults to `~/.config`. Install fzf and source the appropriate generated file after your other fzf options. For example, with the default paths:

```bash
# Add to ~/.bashrc
source "$HOME/.config/fzf/themes/noctalia.sh"
```

```fish
# Add to ~/.config/fish/config.fish
source "$HOME/.config/fzf/themes/noctalia.fish"
```

Adjust the paths if you use a custom config directory. There is no hook to edit your shell startup files or reload an existing shell; source the file yourself to apply newly generated colors.

Both snippets replace previously applied Noctalia color options when sourced again, including after a palette change, while preserving unrelated `FZF_DEFAULT_OPTS` settings. The Fish snippet persists its options using universal variables.
