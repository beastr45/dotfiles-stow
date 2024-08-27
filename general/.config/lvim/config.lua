-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/

-- Options
vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines
-- Use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.cursorline = true --highlight the current line
-- space in the neovim command line for displaying messages
vim.opt.cmdheight = 0
-- add title to windows displaying what directory we are in
vim.opt.winbar = "%=%m %f"
-- Set highlight on search
vim.o.hlsearch = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.g.autoformat = false
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
vim.opt.foldenable = false

-- Keymaps

-- Disabled keymaps
lvim.builtin.which_key.mappings['c'] = {}

local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>o", "o<Esc>", opts)
vim.keymap.set("n", "<leader>O", "O<Esc>", opts)
-- lvim.builtin.which_key.mappings['o'] = { "o<Esc>" }
-- lvim.builtin.which_key.mappings['O'] = { "O<Esc>" }

-- close current buffer with <leader + b + w>
vim.keymap.set("n", "<leader>bw", ":bw <cr>", { desc = "close buffer" })
lvim.builtin.which_key.mappings["bw"] = { ":bw <cr>", "Close Buffer" }

-- Move to window using the <ctrl> hjkl keys but with tmux extenstion
lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "q:", "<nop>", opts)

vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})

-- comment box keymaps
vim.keymap.set({ "n", "v" }, "<leader>c/b", "<Cmd>CBlcbox<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>c/l", "<Cmd>CBllline 6<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>c/d", "<Cmd>CBd<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>c/y", "<Cmd>CBy<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>c/c", "<Cmd>CBcatalog<CR>", opts)


vim.keymap.set("n", "<leader>cg", "<Cmd>make<CR>")
vim.keymap.set("n", "<leader>ch", "<Cmd>make run<CR>")

-- Insert Mode Remaps--
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)
vim.keymap.set("i", "<C-h>", "<C-w>", opts)

-- Visual Remaps--
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)

vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)



--Lunar vim options
lvim.colorscheme = "gruvbox-material"

lvim.builtin.lualine.options.theme = "gruvbox"
lvim.plugins = {
    { "sainnhe/gruvbox-material" },

    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true,    -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    {
        'wfxr/minimap.vim',
        build = "cargo install --locked code-minimap",
        -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
        config = function()
            vim.cmd("let g:minimap_width = 10")
            vim.cmd("let g:minimap_auto_start = 1")
            vim.cmd("let g:minimap_auto_start_win_enter = 1")
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = { enabled = false },
            })
        end,
    },
    {
        "Pocco81/auto-save.nvim",
        opts = {
            execution_message = {
                message = function() -- message to print on save
                    return ""
                end,
                dim = 0.18,              -- dim the color of `message`
                cleaning_interval = 250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
            },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    { "tpope/vim-sleuth" },
    { "LudoPinelli/comment-box.nvim" },
}

-- Plugin function conf
