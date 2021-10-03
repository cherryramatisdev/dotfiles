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
local package_path_str = "/home/cherry/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/cherry/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/cherry/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/cherry/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cherry/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
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
  AnsiEsc = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/AnsiEsc"
  },
  aniseed = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/aniseed"
  },
  ["compe-conjure"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/compe-conjure"
  },
  conjure = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/conjure"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["ginitpull.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/ginitpull.vim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-local-fennel"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-local-fennel"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
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
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  ["semantical-commits.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/semantical-commits.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["statusline.lua"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/statusline.lua"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/ultisnips"
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
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-enmasse"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-enmasse"
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
  ["vim-jack-in"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-jack-in"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-open-url"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-open-url"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-prettier"
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
  ["vim-sexp"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-sexp"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-snippets"
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
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-zoom"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/vim-zoom"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/cherry/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
