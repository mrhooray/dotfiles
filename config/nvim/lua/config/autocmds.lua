-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
  pattern = "*",
  callback = function()
    -- Save cursor position and search register
    local save_cursor = vim.fn.getpos(".")
    local old_query = vim.fn.getreg("/")

    -- Trim trailing whitespace
    vim.cmd([[%s/\s\+$//e]])

    -- Restore cursor and search
    vim.fn.setpos(".", save_cursor)
    vim.fn.setreg("/", old_query)
  end,
})
