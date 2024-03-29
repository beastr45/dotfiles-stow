--custom lazyvim independent plugins go here
return {
  {
    {
      "Pocco81/auto-save.nvim",
      opts = {
        execution_message = {
          message = function() -- message to print on save
            return ""
          end,
          dim = 0.18, -- dim the color of `message`
          cleaning_interval = 250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
      },
    },
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            -- foldfunc = "builtin",
            -- setopt = true,
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    config = function()
      -- Fold options
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },

  { "tpope/vim-sleuth" },
  {
    "nvim-telescope/telescope.nvim",

    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },

      extensions_list = { "themes", "terms" },
    },
  },
  { "folke/zen-mode.nvim" },
  { "L3MON4D3/LuaSnip", opts = { history = false } },
  -- {
  --   "uga-rosa/ccc.nvim",
  --   config = function()
  --     local ccc = require("ccc")
  --     local mapping = ccc.mapping
  --
  --     ccc.setup({
  --       -- Your preferred settings
  --       -- Example: enable highlighter
  --       highlighter = {
  --         auto_enable = true,
  --         lsp = true,
  --
  --       },
  --     })
  --   end,
  -- },
  {
    "lervag/vimtex",
    config = function()
      -- vim.g.vimtex_view_method = "evince"
      vim.g.vimtex_view_general_viewer = "evince"
      vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
      vim.g.vimtex_compiler_method = "latexmk"

      vim.api.nvim_set_keymap("n", "<leader>cx", ":VimtexCompileSS<CR>", {})
    end,
    ft = "tex",
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      lang = "rust",
      theme = {
        ["normal"] = {
          fg = "#D8A657",
        },
      },
    },
  },
}
