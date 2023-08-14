-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- - [[ Basic Keymaps ]]
local opts = { noremap = true, silent = false }
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--part of remap space as leader key code
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- -- nvim hop remaps
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, {remap=true})
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true})
-- vim.keymap.set('', '<leader>ha', function()
--   hop.hint_char1({ direction = directions.ANYWHERE, anywhere = true, hint_offset = 1 })
-- end, {remap=true})

--keymap for padding
vim.keymap.set("n", "<leader>o", "o<Esc>", opts)
vim.keymap.set("n", "<leader>O", "O<Esc>", opts)

--exit search mode
-- vim.keymap.set("n", "<Esc><Esc>", ":noh <CR>", opts)

-- -- Better window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
-- vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
-- vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
-- vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- -- Resize windows with arrows
-- vim.keymap.set("n", "<C-Up>", ":resize +4<CR>", opts)
-- vim.keymap.set("n", "<C-Down>", ":resize -4<CR>", opts)
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -4<CR>", opts)
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +4<CR>", opts)
--
-- --toggle file viewer
-- vim.keymap.set("n", "<leader>e", ":Neotree toggle <cr>", opts)

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

-- close current buffer with <leader + b + w>
vim.keymap.set("n", "<leader>bw", ":bw <cr>", { desc = "close buffer" })

-- set zenmode keymap
vim.keymap.set("n", "<leader>z", ":ZenMode <CR>", opts)
