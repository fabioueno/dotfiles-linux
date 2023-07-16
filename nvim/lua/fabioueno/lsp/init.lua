local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsp_mason_ok, _ = pcall(require, "fabioueno.lsp.mason")
if not lsp_mason_ok then
  return
end

local lsp_null_ls_ok, _ = pcall(require, "fabioueno.lsp.null-ls")
if not lsp_null_ls_ok then
  return
end

local lsp_handlers_ok, lsp_handlers = pcall(require, "fabioueno.lsp.handlers")
if not lsp_handlers_ok then
  return
end

lsp_handlers.setup()
