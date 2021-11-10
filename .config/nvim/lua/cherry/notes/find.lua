local M = {}

function M:find()
  require("telescope.builtin").find_files {
    prompt_title = "Notes",
    cwd = "~/projects/dotfiles/wiki",
  }
end

return M
