-- Entrypoint for neovim config
-- It's simply bootstraping packer

local execute = vim.api.nvim_command

local fn = vim.fn

local pack_path = fn.stdpath "data" .. "/site/pack"
local fmt = string.format

local function ensure(user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")

-- You need to do this if you want to call the code from init.lua
vim.cmd [[runtime plugin/astronauta.vim]]

-- note taking
require "cherry.notes"

require "cherry.globals"
require "plugins"
-- TODO: If this is useful on the future, enable it
-- require "cherry.statusline"

vim.cmd [[ let mapleader=';' ]]
vim.cmd [[ let maplocalleader=',' ]]
