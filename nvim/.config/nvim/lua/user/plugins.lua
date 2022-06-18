local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have Packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
return packer.startup(function(use)

  -- Packer
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "tpope/vim-dispatch" -- job dispatcher

  -- Language server protocol
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "onsails/lspkind-nvim"
  use "nvim-lua/lsp_extensions.nvim"
  use "glepnir/lspsaga.nvim"
  use "simrat39/symbols-outline.nvim"
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- File formatting and linting (are any necessary with null-ls?)
  -- use "ambv/black" -- python formatting
  -- use "darrikonn/vim-gofmt" -- go formatting

  -- Commenting
  use {
    "numToStr/Comment.nvim", config = function()
      require("Comment").setup()
    end
  }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- use "nvim-treesitter/playground"
  use "romgrk/nvim-treesitter-context"

  -- Completion
  use "hrsh7th/nvim-cmp" -- completion plugin

  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  use "hrsh7th/cmp-nvim-lsp-document-symbol" -- lsp document symbol completions
  use "hrsh7th/cmp-nvim-lua" -- lua completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use "hrsh7th/cmp-cmdline" -- command-line completions

  use "windwp/nvim-autopairs" -- auto-pairs, integrates with cmp and treesitter
  use "tamago324/cmp-zsh" -- command-line completions
  use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })


  use "github/copilot.vim" -- GitHub copilot completions
  -- use { "tzachar/cmp-tabnine", run = "./install.sh" } -- tabnine completions

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Colorschemes
  use "gruvbox-community/gruvbox"
  use "luisiacc/gruvbox-baby"
  use "Mofiqul/dracula.nvim"


  -- Git and GitHub
  use "tpope/vim-fugitive" -- git wrapper
  use "junegunn/gv.vim" -- git commit browser
  use "tpope/vim-rhubarb" -- github wrapper
  use "tpope/vim-surround" -- surrounding parens, etc.

  -- Undo and history
  use "mbbill/undotree" -- show file undo tree like git history

  -- Buffer management
  use "moll/vim-bbye" -- close buffers without altering windo

  -- File browsing
  use "tpope/vim-projectionist" -- quickly find related files
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    -- tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
  }
  -- Telescope
  use "nvim-lua/plenary.nvim" -- helper functions (Telescope dependency)
  use "nvim-lua/popup.nvim" -- popup window manager (Telescope dependency)
  use "nvim-telescope/telescope.nvim" -- telescope fuzzy finder
  use "nvim-telescope/telescope-fzy-native.nvim" -- use native fzy for telescope

  -- Tmux integration
  -- use { "alexghergh/nvim-tmux-navigation" }
  -- use "christoomey/vim-tmux-navigator" -- tmux integration
  -- vim.cmd(" let g:tmux_navigator_no_mappings = 0 ")
  use "sunaku/tmux-navigate"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
