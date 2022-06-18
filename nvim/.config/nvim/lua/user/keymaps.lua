local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Config keymaps --
vim.keymap.set("n", ",f", ":Telescope find_files cwd=~/.config/nvim<CR>", opts)
vim.keymap.set("n", ",g", ":Telescope grep_string cwd=~/.config/nvim<CR>", opts)
vim.keymap.set("n", ",o", ":vs ~/.config/nvim/lua/user/options.lua<CR>", opts)
vim.keymap.set("n", ",k", ":vs ~/.config/nvim/lua/user/keymaps.lua<CR>", opts)
vim.keymap.set("n", ",p", ":vs ~/.config/nvim/lua/user/plugins.lua<CR>", opts)
vim.keymap.set("n", ",l", ":vs ~/.config/nvim/lua/user/lsp/init.lua<CR>", opts)
vim.keymap.set("n", ",c", ":vs ~/.config/nvim/lua/user/cmp.lua<CR>", opts)
vim.keymap.set("n", ",,", ":vs ~/.config/nvim/init.lua<CR>", opts)
vim.keymap.set("n", ",s", ":luafile %<CR>", opts)

vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>g", ":Telescope grep_string<CR>", opts)

vim.keymap.set("n", "<leader>c", ":Bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>q", ":bufdo :Bdelete!<CR>", opts)

vim.keymap.set("n", "<esc>", ":nohl<CR>", opts)
vim.keymap.set("n", "<enter>", ":nohl<CR>", opts)

vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<CR>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
vim.keymap.set("n", "<leader>lj", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set("n", "<leader>lk", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
