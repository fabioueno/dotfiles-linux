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
    install_path
  }

  print "Installing packer. Restart neovim."

  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload Neovim whenever this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

return packer.startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim"

  -- Basics
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Colorscheme
  use "joshdick/onedark.vim"

  -- General
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"

  -- Editing
  use "numToStr/Comment.nvim"
  use "windwp/nvim-autopairs"

  -- Codeium
  use {
    "Exafunction/codeium.vim",
    config = function ()
      vim.keymap.set("i", "<C-g>", function ()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
