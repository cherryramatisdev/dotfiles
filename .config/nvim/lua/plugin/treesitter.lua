---@diagnostic disable: undefined-global
require'nvim-treesitter.configs'.setup {
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}

vim.opt.foldlevel=99
vim.opt.foldmethod='expr'
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr() ]]
