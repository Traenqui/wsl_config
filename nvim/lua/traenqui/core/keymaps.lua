vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with jk" })

-- for config tinkering
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "edit: Execute current lua line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute current file" })

-- Suckless
-- EDIT
vim.keymap.set("n", "<S-Tab>", ":normal zs<CR>", { noremap = true, silent = true, desc = "edit: Toggle code fold" })
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true, desc = "edit: Yank text to EOL" })
vim.keymap.set("n", "D", "d$", { noremap = true, silent = true, desc = "edit: Delete text to EOL" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "edit: Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "edit: Prev search result" })
vim.keymap.set("n", "<BS>", "^", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>o", "<cmd>setlocal spell! spelllang=en_us", { desc = "edit: Toggle spell check" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "edit: Clear search highlights" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "edit: Move this line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "edit: Move this line down" })
-- WINDOW
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "window: Focus left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "window: Focus right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "window: Focus down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "window: Focus up" })

vim.keymap.set("t", "<C-w>h", "<cmd>wincmd h<CR>", { noremap = true, desc = "window: Focus left" })
vim.keymap.set("t", "<C-w>l", "<cmd>wincmd l<CR>", { noremap = true, desc = "window: Focus right" })
vim.keymap.set("t", "<C-w>j", "<cmd>wincmd j<CR>", { noremap = true, desc = "window: Focus down" })
vim.keymap.set("t", "<C-w>k", "<cmd>wincmd k<CR>", { noremap = true, desc = "window: Focus up" })

vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -3<CR>", { silent = true, desc = "window: Resize -3 vertically" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +3<CR>", { silent = true, desc = "window: Resize +3 vertically" })
vim.keymap.set("n", "<A-j>", "<cmd>resize -3<CR>", { silent = true, desc = "window: Resize -3 horizontally" })
vim.keymap.set("n", "<A-k>", "<cmd>resize +3<CR>", { silent = true, desc = "window: Resize +3 horizontally" })

vim.keymap.set("n", "=l", function()
	local win = vim.api.nvim_get_current_win()
	local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local action = qf_winid > 0 and "lclose" or "lopen"
	vim.cmd(action)
end, { desc = "window: toggle location list", noremap = true, silent = true })

vim.keymap.set("n", "=q", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd("botright " .. action)
end, { desc = "window: toggle quickfix list", noremap = true, silent = true })
