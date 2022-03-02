require("orgmode").setup_ts_grammar()

require("orgmode").setup {
  org_agenda_files = {"~/todos/*"},
  org_default_notes_file = "~/todos/refile.org"
}

vim.keymap.set(
  "n",
  "<leader>F",
  function()
    require("telescope.builtin").find_files {
      prompt_title = "~ todos ~",
      shorten_path = false,
      cwd = "~/todos/"
    }
  end
)
