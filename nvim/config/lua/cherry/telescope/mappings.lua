local actions = require "telescope.actions"

vim.keymap.set(
  "n",
  "<leader>f",
  function()
    require("telescope.builtin").find_files()
  end
)

vim.keymap.set(
  "n",
  "<leader>l",
  function()
    require("telescope.builtin").live_grep()
  end
)

local function buffers()
  local opts_with_preview

  opts_with_preview = {
    prompt_title = "~ buffers ~",
    attach_mappings = function(_, map)
      map(
        "i",
        "<C-d>",
        function(prompt_bufnr)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:delete_selection(
            function(selection)
              vim.api.nvim_buf_delete(selection.bufnr, {force = true})
            end
          )
        end
      )

      return true
    end
  }

  require("telescope.builtin").buffers(opts_with_preview)
end

vim.keymap.set(
  "n",
  "<leader>b",
  function()
    buffers()
  end
)
--
-- vim.keymap.set(
--   "n",
--   "<leader>e",
--   function()
--     require("telescope").extensions.file_browser.file_browser()
--   end
-- )

local function switchProjects()
  local opts_with_preview

  opts_with_preview = {
    prompt_title = "~ projects ~",
    shorten_path = false,
    cwd = "~/git/",
    attach_mappings = function(_, map)
      map(
        "i",
        "<CR>",
        function(prompt_bufnr)
          actions.close(prompt_bufnr)
          local filepath = require("telescope.actions.state").get_selected_entry(prompt_bufnr)[1]
          local runner = "tabnew | tcd " .. filepath

          if string.len(vim.fn.expand("%")) <= 0 then
            runner = "tcd " .. filepath
          end

          vim.cmd(runner)

          require("telescope.builtin").find_files()
        end
      )

      return true
    end
  }

  require("telescope").extensions.file_browser.file_browser(opts_with_preview)
end

vim.keymap.set(
  "n",
  "<leader>p",
  function()
    switchProjects()
  end
)
