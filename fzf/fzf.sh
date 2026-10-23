fzf_theme_opts="\
--color=bg+:{{colors.surface_variant.default.hex}} \
--color=bg:{{colors.surface.default.hex}} \
--color=spinner:{{colors.terminal_cursor.default.hex}} \
--color=hl:{{colors.error.default.hex}} \
--color=fg:{{colors.terminal_foreground.default.hex}} \
--color=header:{{colors.error.default.hex}} \
--color=info:{{colors.primary.default.hex}} \
--color=pointer:{{colors.terminal_cursor.default.hex}} \
--color=marker:{{colors.on_surface_variant.default.hex}} \
--color=fg+:{{colors.on_surface.default.hex}} \
--color=prompt:{{colors.primary.default.hex}} \
--color=hl+:{{colors.error.default.hex}} \
--color=selected-bg:{{colors.terminal_normal_black.default.hex}} \
--color=border:{{colors.terminal_selection_bg.default.hex}} \
--color=label:{{colors.on_surface.default.hex}}"

# Preserve existing options and remove previously applied colors.
fzf_existing_opts=${FZF_DEFAULT_OPTS-}

if [ -n "${NOCTALIA_FZF_LAST_THEME_OPTS-}" ]; then
    fzf_existing_opts=${fzf_existing_opts//" $NOCTALIA_FZF_LAST_THEME_OPTS"/}
    fzf_existing_opts=${fzf_existing_opts//"$NOCTALIA_FZF_LAST_THEME_OPTS "/}
    fzf_existing_opts=${fzf_existing_opts//"$NOCTALIA_FZF_LAST_THEME_OPTS"/}
fi

# Apply the current theme without accumulating duplicates.
export FZF_DEFAULT_OPTS="${fzf_existing_opts:+$fzf_existing_opts }$fzf_theme_opts"

# Remember the applied colors for the next synchronization.
export NOCTALIA_FZF_LAST_THEME_OPTS="$fzf_theme_opts"

unset fzf_existing_opts fzf_theme_opts
