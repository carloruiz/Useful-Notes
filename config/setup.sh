#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Update default Homebrew packages
brew upgrade

# Install vim (will also install a bunch of stuff, e.g. python, perl, lua, openssl)
brew install nvim bash-completion

# Install universal ctags (excuberant ctags) for code navigation
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
# Install Kubernetes CLI and K9s GUI
brew install kubectl k9s vault tfenv

# Install some common CLI tools 
brew install coreutils jq

# Install vim-plug. Plugin manager for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Make bash the default shell (it will require password)
chsh -s /bin/bash



echo "Automatic portion done!
   
  Run the following commands sequentially:

nvim +PlugInstall
nvim +GoInstallBinaries
"
