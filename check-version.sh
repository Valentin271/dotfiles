#!/bin/bash
set -uo pipefail

names=(
    "Alacritty"
    "Inlyne"
    "Lazygit"
    "Lazydocker"
    "Neovim"
    "xh"
)
current=(
    alacritty_current
    inlyne_current
    lazygit_current
    lazydocker_current
    nvim_current
    xh_current
)
latest=(
    alacritty_latest
    inlyne_latest
    lazygit_latest
    lazydocker_latest
    nvim_latest
    xh_latest
)

app_main () {
    for i in "${!names[@]}"; do
        cur=$(${current[$i]})
        lat=$(${latest[$i]})
        if [[ ${cur} != ${lat} ]]; then
            echo -e "\e[1m${names[$i]}\e[m:  \e[33m${cur} -> ${lat}\e[m"
        else
            echo -e "\e[1m${names[$i]}\e[m: \e[32mok\e[m"
        fi
    done
}

alacritty_current () { echo $(alacritty --version | cut -d' ' -f2); }
inlyne_current () { echo $(inlyne --version | cut -d' ' -f2); }
lazygit_current () { echo $(lazygit --version | cut -d','  -f4 | grep -Po '=\K.*'); }
lazydocker_current () { echo $(lazydocker --version | grep -Po 'Version: \K.*'); }
nvim_current () { echo $(nvim --version | grep -Po 'NVIM v\K.+'); }
xh_current () { echo $(xh --version | head -n1 | cut -d' ' -f2); }

alacritty_latest () { cargo_search alacritty; }
inlyne_latest () { cargo_search inlyne; }
lazygit_latest () { echo $(curl -s 'https://api.github.com/repos/jesseduffield/lazygit/releases/latest' | jq -r .tag_name | tr -d v); }
lazydocker_latest () { echo $(curl -s 'https://api.github.com/repos/jesseduffield/lazydocker/releases/latest' | jq -r .tag_name | tr -d v); }
nvim_latest () { echo $(curl -s 'https://api.github.com/repos/neovim/neovim/releases' | jq -r '.[].tag_name' | sort -V | tail -n1 | tr -d v); }
xh_latest () { cargo_search xh; }

cargo_search() {
    echo $(cargo search $1 | head -n1 | grep -Po '= "\K[^"]+');
}

app_main
