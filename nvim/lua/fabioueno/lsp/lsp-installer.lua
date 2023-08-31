local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("fabioueno.lsp.handlers").on_attach,
    capabilities = require("fabioueno.lsp.handlers").capabilities
  }

  local server_opts = { }

  if server.name == "jsonls" then
    server_opts = require("fabioueno.lsp.settings.jsonls")
  elseif server.name == "sumneko_lua" then
    server_opts = require("fabioueno.lsp.settings.sumneko_lua")
  elseif server.name == "elixirls" then
    server_opts = require("fabioueno.lsp.settings.elixirls")
  elseif server.name == "pyright" then
    server_opts = require("fabioueno.lsp.settings.pyright").settings()
  end

  opts = vim.tbl_deep_extend("force", server_opts, opts)

  server:setup(opts)
end)
