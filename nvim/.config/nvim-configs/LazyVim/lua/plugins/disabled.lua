-- In order to disable a plugin, add a spec with enabled=false
-- example:
-- -- disable trouble
-- { "folke/trouble.nvim", enabled = false }

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = { autoformat = false },
  -- },
  { "rcarriga/nvim-notify", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },

  {
    "folke/lazy.nvim",
    config = function()
      require("lazy").setup({
        checker = { enabled = false, notify = false }, -- automatically check for plugin updates
      })
    end,
  },
}
