#!/usr/bin/bash
# shebang is mainly for coloration
# To symlink to ~/.bash_aliases

# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert
# Icons require gnome-icon-theme
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo computer || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias lg="lazygit"
# Be careful with the GNU linker
alias ld="lazydocker"

alias zathura="zathura --fork"

function fp() {
    if [ -f /tmp/theme.toml ]; then
        theme="dark"
    else
        theme="light"
    fi

    cd "$(command fp --theme "$theme" "$@")" || return
}

alias c=cargo
alias cn="cargo +nightly"

# See https://doc.rust-lang.org/rustdoc/unstable-features.html#--show-coverage-calculate-the-percentage-of-items-with-documentation
cdc() {
    RUSTDOCFLAGS="-Zunstable-options --show-coverage" cn doc --no-deps
}
