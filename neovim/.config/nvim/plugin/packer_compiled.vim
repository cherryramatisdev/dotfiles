" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/fabioramatis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/fabioramatis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/fabioramatis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/fabioramatis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/fabioramatis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21cherry.formatter\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["fugitive-gitlab.vim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19cherry.harpoon\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["manillua.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/manillua.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21cherry.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22cherry.completion\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15cherry.lsp\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23cherry.filebrowser\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22cherry.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_utils = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/nvim_utils"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  pinnacle = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/pinnacle"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17cherry.fuzzy\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17cherry.snips\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-capslock"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-capslock"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-dotoo"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-dotoo"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-rsi"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22cherry.testrunner\frequire\0" },
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/fabioramatis/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22cherry.testrunner\frequire\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22cherry.completion\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21cherry.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15cherry.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17cherry.snips\frequire\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21cherry.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23cherry.filebrowser\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22cherry.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17cherry.fuzzy\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19cherry.harpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
