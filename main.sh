#!/usr/bin/env bash

set -o errexit

reset_color=$(tput sgr 0)

info() {
  printf "%s[*] %s%s\n" "$(tput setaf 4)" "$1" "$reset_color"
}

success() {
  printf "%s[*] %s%s\n" "$(tput setaf 2)" "$1" "$reset_color"
}

err() {
  printf "%s[*] %s%s\n" "$(tput setaf 1)" "$1" "$reset_color"
}

warn() {
  printf "%s[*] %s%s\n" "$(tput setaf 3)" "$1" "$reset_color"
}

info "####### dotfiles #######"

# misc stuff to be split into more appropriate files

## nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
source ~/.zshrc
nvm install --lts
nvm use --lts
NODE_LTS_VERSION="$(nvm current)"
nvm alias default $NODE_LTS_VERSION
npm install npm --global

. brew.sh
. macos.sh