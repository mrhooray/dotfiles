return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").mojo.setup({})
    end,
  },
  {
    "czheo/mojo.vim",
    ft = "mojo",
  },
}
