local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
  return
end

configs.setup {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "diff",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "git_rebase",
    "go",
    "graphql",
    "heex",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "kotlin",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "scss",
    "sql",
    "terraform",
    "toml",
    "vim",
    "vimdoc",
    "yaml"
  },
  ignore_install = { "" },

  sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable  = true, -- False will disable the whole extension
    disable = {}    -- List of language that will be disabled
  },

  autopairs = { enable = true },
  indent    = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}
