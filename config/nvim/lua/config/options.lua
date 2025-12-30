-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { ".git", "cwd" }
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 0
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.undofile = false
vim.opt.writebackup = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "json" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

if os.getenv("SSH_TTY") then
  vim.o.clipboard = "unnamedplus"

  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
