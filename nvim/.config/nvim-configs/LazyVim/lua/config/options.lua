-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.winbar = "%=%m %f"

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- -- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 4
-- insert 4 spaces for a tab
vim.opt.tabstop = 4

--highlight the current line
vim.o.cursorline = true

-- always show the sign column, otherwise it would shift the text each time
vim.o.signcolumn = "yes"

-- force all vertical splits to go to the right of current window
vim.o.splitright = true

-- space in the neovim command line for displaying messages
vim.opt.cmdheight = 0

-- add title to windows displaying what directory we are in
vim.opt.winbar = "%=%m %f"

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

--enable line wrap
vim.opt.wrap = true

vim.opt.relativenumber = false

-- vim.opt.cursorcolumn = true

vim.g.autoformat = false
