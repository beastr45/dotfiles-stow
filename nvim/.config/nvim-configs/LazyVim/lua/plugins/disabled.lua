-- In order to disable a plugin, add a spec with enabled=false
-- example:
-- -- disable trouble
-- { "folke/trouble.nvim", enabled = false }

return {
  {
    "neovim/nvim-lspconfig",
    opts = { autoformat = false },
  },
  { "rcarriga/nvim-notify", enabled = false },
}
