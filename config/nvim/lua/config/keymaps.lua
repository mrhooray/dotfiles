-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = false }

vim.keymap.set("n", "<C-s>", "<nop>", opts)
vim.keymap.set("n", "q", "<Nop>", opts)
vim.keymap.set("n", "Q", "<Nop>", opts)
vim.keymap.set("n", "<leader>fs", ":w!<cr>", opts)
vim.keymap.set("n", "<leader>p", ":set paste<cr>", opts)
vim.keymap.set("n", "<leader>pp", ":set nopaste<cr>", opts)
vim.keymap.set("c", "<C-f>", "<Right>", opts)
vim.keymap.set("c", "<C-b>", "<Left>", opts)
vim.keymap.set("c", "<C-a>", "<Home>", opts)
vim.keymap.set("c", "<C-e>", "<vim>", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })
