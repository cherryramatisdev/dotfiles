local M = {}

function M:search_dotfiles()
  require("telescope.builtin").find_files(
    {
      prompt_title = "< VimRC >",
      cwd = "~/projects/dotfiles/.config/nvim/",
      hidden = true
    }
  )
end

return M
