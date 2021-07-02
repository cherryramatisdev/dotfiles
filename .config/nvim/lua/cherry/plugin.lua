local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin.fnl"
local _0_
do
  local name_0_ = "cherry.plugin"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  do end (module_0_)["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  do end (package.loaded)[name_0_] = module_0_
  _0_ = module_0_
end
local autoload
local function _1_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _1_
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {a = "aniseed.core", nvim = "aniseed.nvim", packer = "packer"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local a = _local_0_[1]
local nvim = _local_0_[2]
local packer = _local_0_[3]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local safe_require_plugin_config
do
  local v_0_
  do
    local v_0_0
    local function safe_require_plugin_config0(name)
      local ok_3f, val_or_err = pcall(require, ("cherry.plugin." .. name))
      if not ok_3f then
        return print(("dotfiles error: " .. val_or_err))
      end
    end
    v_0_0 = safe_require_plugin_config0
    _0_["safe-require-plugin-config"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["safe-require-plugin-config"] = v_0_
  safe_require_plugin_config = v_0_
end
local use
do
  local v_0_
  local function use0(...)
    local pkgs = {...}
    local function _3_(use1)
      for i = 1, a.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _4_ = opts.mod
          if _4_ then
            safe_require_plugin_config(_4_)
          else
          end
        end
        use1(a.assoc(opts, 1, name))
      end
      return nil
    end
    return packer.startup(_3_)
  end
  v_0_ = use0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["use"] = v_0_
  use = v_0_
end
return use("Olical/AnsiEsc", {}, "Olical/aniseed", {branch = "develop"}, "Olical/conjure", {branch = "develop", mod = "conjure"}, "neovim/nvim-lspconfig", {mod = "lsp"}, "glepnir/lspsaga.nvim", {mod = "lsp"}, "Olical/vim-enmasse", {}, "wbthomason/packer.nvim", {}, "JoosepAlviste/nvim-ts-context-commentstring", {}, "windwp/nvim-ts-autotag", {}, "nvim-treesitter/nvim-treesitter", {mod = "treesitter", run = ":TSUpdate"}, "srcery-colors/srcery-vim", {mod = "colors"}, "tami5/compe-conjure", {}, "hrsh7th/nvim-compe", {mod = "compe"}, "kristijanhusak/orgmode.nvim", {mod = "org"}, "kyazdani42/nvim-web-devicons", {}, "nvim-lua/popup.nvim", {}, "nvim-lua/plenary.nvim", {}, "nvim-telescope/telescope.nvim", {mod = "telescope"}, "tpope/vim-commentary", {}, "jiangmiao/auto-pairs", {mod = "autopairs"}, "tpope/vim-surround", {}, "tpope/vim-vinegar", {}, "tpope/vim-rsi", {}, "itchyny/vim-gitbranch", {}, "TimUntersberger/neogit", {mod = "git"}, "itchyny/lightline.vim", {mod = "statusline"}, "ThePrimeagen/harpoon", {mod = "harpoon"}, "mhartington/formatter.nvim", {mod = "format"}, "tpope/vim-dispatch", {}, "radenling/vim-dispatch-neovim", {}, "clojure-vim/vim-jack-in", {}, "guns/vim-sexp", {mod = "sexp"}, "tpope/vim-sexp-mappings-for-regular-people", {}, "SirVer/ultisnips", {mod = "snippets"}, "honza/vim-snippets", {}, "easymotion/vim-easymotion", {mod = "easymotion"})