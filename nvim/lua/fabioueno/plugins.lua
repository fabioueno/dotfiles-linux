local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })

  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads Neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
})

-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use { "wbthomason/packer.nvim" } -- Have packer manage itself

  -- Basics
  use { "nvim-lua/plenary.nvim" }       -- Useful lua functions used by lots of plugins
  use { "nvim-tree/nvim-web-devicons" } -- Dev icons

  -- Colorscheme
  use { "lunarvim/darkplus.nvim" }

  -- General
  use { "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" }   -- Bufferline
  use { "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons" } -- Statusline

  use { "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }   -- Fuzzy finder
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }                  -- Syntax highlight

  use { "lukas-reineke/indent-blankline.nvim" }                                 -- Indentation guide lines

  -- Editing
  use { "numToStr/Comment.nvim" }                       -- Autocomment, supports treesitter and commentstring
  use { "JoosepAlviste/nvim-ts-context-commentstring" } -- Comment utility

  use { "windwp/nvim-autopairs" }                       -- Autopairs, integrates with both cmp and treesitter

  -- Completion
  use { "hrsh7th/nvim-cmp" }         -- Completion plugin
  use { "hrsh7th/cmp-buffer" }       -- Buffer completions
  use { "hrsh7th/cmp-cmdline" }      -- CLI completions
  use { "hrsh7th/cmp-path" }         -- Path completions
  use { "saadparwaiz1/cmp_luasnip" } -- Snippet completions

  use { "hrsh7th/cmp-nvim-lsp" } -- Neovim LSP API
  use { "hrsh7th/cmp-nvim-lua" } -- Neovim Lua API

  use { "L3MON4D3/LuaSnip" }    -- Snippet engine

  -- LSP
  use { "neovim/nvim-lspconfig" }                         -- Enable LSP
  use { "williamboman/mason.nvim", run = ":MasonUpdate" } -- LSP manager
  use { "williamboman/mason-lspconfig.nvim" }             -- Mason helper
  use { "jose-elias-alvarez/null-ls.nvim" }               -- Formatters and linters

  -- use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  -- use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  -- use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  -- use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  -- use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  -- use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  -- use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  -- use {"folke/which-key.nvim"}

  -- Cmp 

  -- Snippets
  -- use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- LSP
  -- use { "RRethy/vim-illuminate", commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298" }

  -- Git
  -- use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
