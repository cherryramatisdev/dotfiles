-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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
local package_path_str = "/home/cherry/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cherry/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cherry/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cherry/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cherry/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  LuaSnip = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugin.snippets\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["cyclist.vim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.listchars\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/cyclist.vim"
  },
  ["ginitpull.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/ginitpull.vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugin.statusline\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["modus-theme-vim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugin.colorscheme\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  neogit = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugin.git\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.autopairs\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugin.lsp\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugin.treesitter\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugin.project\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["quickfix-reflector.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/quickfix-reflector.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-arecibo.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/telescope-arecibo.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.telescope\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugin.todo\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugin.terminal\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugin.trouble\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vifm.vim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugin.vifm\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vifm.vim"
  },
  ["vim-ReplaceWithRegister"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-ReplaceWithRegister"
  },
  ["vim-characterize"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-characterize"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-dirvish"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugin.file_browser\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-dirvish-dovish"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dirvish-dovish"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dotenv"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-mpc"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-mpc"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-rsi"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-function"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-textobj-function"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-titlecase"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-titlecase"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-zoom"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-zoom"
  },
  vira = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugin.jira\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vira"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugin.whichkey\frequire\0" },
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugin.terminal\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugin.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugin.trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugin.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vifm.vim
time([[Config for vifm.vim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugin.vifm\frequire\0", "config", "vifm.vim")
time([[Config for vifm.vim]], false)
-- Config for: cyclist.vim
time([[Config for cyclist.vim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.listchars\frequire\0", "config", "cyclist.vim")
time([[Config for cyclist.vim]], false)
-- Config for: modus-theme-vim
time([[Config for modus-theme-vim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugin.colorscheme\frequire\0", "config", "modus-theme-vim")
time([[Config for modus-theme-vim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugin.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugin.statusline\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugin.git\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugin.whichkey\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: vim-dirvish
time([[Config for vim-dirvish]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugin.file_browser\frequire\0", "config", "vim-dirvish")
time([[Config for vim-dirvish]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugin.snippets\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugin.todo\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vira
time([[Config for vira]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugin.jira\frequire\0", "config", "vira")
time([[Config for vira]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
