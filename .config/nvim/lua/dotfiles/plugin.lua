local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin.fnl"
local _2amodule_name_2a = "dotfiles.plugin"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, nvim, packer = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["packer"] = packer
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("dotfiles.plugin." .. name))
  if not ok_3f then
    return print(("dotfiles error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function use(...)
  local pkgs = {...}
  local function _2_(use0)
    for i = 1, a.count(pkgs), 2 do
      local name = pkgs[i]
      local opts = pkgs[(i + 1)]
      do
        local _3_ = opts.mod
        if _3_ then
          safe_require_plugin_config(_3_)
        else
        end
      end
      use0(a.assoc(opts, 1, name))
    end
    return nil
  end
  return packer.startup(_2_)
end
_2amodule_locals_2a["use"] = use
return use("cherryramatisdev/semantical-commits.vim", {}, "Olical/AnsiEsc", {}, "Olical/aniseed", {branch = "develop"}, "Olical/conjure", {branch = "develop", mod = "conjure"}, "Olical/nvim-local-fennel", {}, "Olical/vim-enmasse", {}, "beauwilliams/statusline.lua", {mod = "statusline"}, "kyazdani42/nvim-web-devicons", {}, "folke/tokyonight.nvim", {mod = "color"}, "inkarkat/vim-ReplaceWithRegister", {}, "christoomey/vim-titlecase", {}, "kana/vim-textobj-user", {}, "kana/vim-textobj-line", {}, "kana/vim-textobj-function", {}, "kana/vim-textobj-entire", {}, "tpope/vim-fugitive", {mod = "fugitive"}, "tpope/vim-sensible", {}, "tpope/vim-sleuth", {}, "tpope/vim-repeat", {}, "tpope/vim-unimpaired", {}, "tpope/vim-surround", {}, "tpope/vim-vinegar", {}, "tpope/vim-obsession", {}, "tpope/vim-commentary", {}, "tpope/vim-rsi", {}, "tpope/vim-scriptease", {}, "tpope/vim-eunuch", {}, "tpope/vim-characterize", {}, "tpope/vim-markdown", {}, "tpope/vim-endwise", {}, "AndrewRadev/tagalong.vim", {}, "AndrewRadev/ginitpull.vim", {}, "dhruvasagar/vim-open-url", {}, "dhruvasagar/vim-zoom", {}, "fatih/vim-go", {}, "mattn/emmet-vim", {}, "SirVer/ultisnips", {}, "honza/vim-snippets", {}, "guns/vim-sexp", {mod = "sexp"}, "tpope/vim-sexp-mappings-for-regular-people", {}, "folke/todo-comments.nvim", {mod = "todo", requires = {{"nvim-lua/plenary.nvim"}}}, "folke/which-key.nvim", {mod = "which-key"}, "tweekmonster/startuptime.vim", {}, "dense-analysis/ale", {mod = "ale"}, "wbthomason/packer.nvim", {}, "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate", mod = "treesitter"}, "nvim-telescope/telescope.nvim", {mod = "telescope", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}, "ahmedkhalf/project.nvim", {mod = "project"})