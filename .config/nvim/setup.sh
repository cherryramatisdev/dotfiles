#!/bin/bash

# List of all packages to install.
# Currently this requires that each package
# lives on github.com
PACKAGES=(
    "pbrisbin/vim-colors-off"
    "owickstrom/vim-colors-paramount"
    "tpope/vim-commentary"
    "tpope/vim-surround"
    "tpope/vim-fugitive"
    "tpope/vim-rsi"
    "tpope/vim-sensible"
    "tpope/vim-vinegar"
    "tpope/vim-repeat"
    "neovim/nvim-lspconfig"
    "kabouzeid/nvim-lspinstall"
    "glepnir/lspsaga.nvim"
    "hrsh7th/nvim-compe"
    "hrsh7th/vim-vsnip"
    "hrsh7th/vim-vsnip-integ"
    "nvim-treesitter/nvim-treesitter"
    "nvim-telescope/telescope.nvim"
    "nvim-lua/popup.nvim"
    "nvim-lua/plenary.nvim"
    "nvim-telescope/telescope.nvim"
    "mhartington/formatter.nvim"
)
PACKAGE_PATH="$HOME/.local/share/nvim/site/pack/cherry"

if [[ $1 == "--install" ]]
then
    mkdir -p $PACKAGE_PATH/opt/

    cd $PACKAGE_PATH/opt
    for package in "${PACKAGES[@]}"
    do
        git clone "https://github.com/$package"
    done
elif [[ $1 == "--reinstall" ]]
then
    rm -rf $PACKAGE_PATH
    mkdir -p $PACKAGE_PATH/opt/

    cd ~/.local/share/nvim/site/pack/cherry/opt/
    for package in "${PACKAGES[@]}"
    do
        git clone "https://github.com/$package"
    done
else
    for package in `ls $PACKAGE_PATH/opt/`
    do
        path="$PACKAGE_PATH/opt/$package"
        (cd $path && git pull)
    done
fi
