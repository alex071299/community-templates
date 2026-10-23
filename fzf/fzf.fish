set -l fzf_theme_opts "\
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
set -l fzf_existing_opts "$FZF_DEFAULT_OPTS"

if set -q __noctalia_fzf_last_theme[1]
    set fzf_existing_opts (
        string replace -a -- \
            "$__noctalia_fzf_last_theme" '' \
            "$fzf_existing_opts" | string trim
    )
end

# Apply the current theme without accumulating duplicates.
if test -n "$fzf_existing_opts"
    set -Ux FZF_DEFAULT_OPTS "$fzf_existing_opts $fzf_theme_opts"
else
    set -Ux FZF_DEFAULT_OPTS "$fzf_theme_opts"
end

# Remember the applied colors for the next synchronization.
set -U __noctalia_fzf_last_theme "$fzf_theme_opts"
