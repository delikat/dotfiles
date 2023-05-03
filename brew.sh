install_brew() {
  if [[ $(brew --version) ]] ; then
      echo "Attempting to update Homebrew from version $(brew --version)"
      brew update
  else
      echo "Attempting to install Homebrew"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  eval "$(/opt/homebrew/bin/brew shellenv)"
  
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  brew update; brew upgrade --cask; brew cleanup || true

  echo Effective Homebrew version:
  brew --version
}

install_packages() {
  brew install mas
}

install_casks() {
  info "Installing casks"
  casks=(
    brave-browser
    docker
    google-chrome
    iterm2
    menumeters
    monitorcontrol
    signal
    spotify
    visual-studio-code
  )
  for cask in $casks; do
    info "Installing cask: ${cask}"
    brew install --cask ${cask}
  done
}

list_all() {
  success "Installed Homebrew Packages:"
  brew leaves

  success "Installed Homebrew Casks:"
  brew list --cask
}

install_mas() {
  masApps=(
    "937984704" # Amphetamine
    "803453959" # Slack
    "747648890" # Telegram
  )
  info "Installing App Store apps..."
  for app in $masApps; do
    mas install $app
  done
}

main() {
  install_brew
  install_packages
  install_casks
  install_mas
  list_all
}



main
