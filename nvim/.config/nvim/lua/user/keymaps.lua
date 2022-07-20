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

keymap("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<cmd>m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- Config keymaps {{{
vim.keymap.set("n", ",f", "<cmd>Telescope find_files hidden=true cwd=~/.config/nvim<CR>", opts)
vim.keymap.set("n", ",g", "<cmd>Telescope grep_string cwd=~/.config/nvim<CR>", opts)
vim.keymap.set("n", ",o", "<cmd>e ~/.config/nvim/lua/user/options.lua<CR>", opts)
vim.keymap.set("n", ",k", "<cmd>e ~/.config/nvim/lua/user/keymaps.lua<CR>", opts)
vim.keymap.set("n", ",p", "<cmd>e ~/.config/nvim/lua/user/plugins.lua<CR>", opts)
vim.keymap.set("n", ",l", "<cmd>e ~/.config/nvim/lua/user/lsp/init.lua<CR>", opts)
vim.keymap.set("n", ",c", "<cmd>e ~/.config/nvim/lua/user/cmp.lua<CR>", opts)
vim.keymap.set("n", ",,", "<cmd>e ~/.config/nvim/init.lua<CR>", opts)
vim.keymap.set("n", ",s", "<cmd>luafile %<CR>", { noremap = true })
-- }}}

-- Telescope keymaps {{{
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=false<CR>", opts)
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files hidden=true<CR>", opts)
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", opts)
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope grep_string<CR>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)
-- }}}

vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<CR>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
vim.keymap.set("n", "<leader>lj", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set("n", "<leader>lk", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>q", "<cmd>bufdo :Bdelete!<CR>", opts)

vim.keymap.set("n", "<esc>", "<cmd>nohl<CR>", opts)
vim.keymap.set("n", "<enter>", "<cmd>nohl<CR>", opts)
