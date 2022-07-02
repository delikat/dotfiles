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
  install_packages
  install_casks
  install_mas
  list_all
}

main
