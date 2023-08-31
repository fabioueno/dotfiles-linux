local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("fabioueno.lsp.lsp-installer")
require("fabioueno.lsp.handlers").setup()
