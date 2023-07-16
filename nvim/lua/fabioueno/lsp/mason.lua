local settings = {
	ui = {
		border = "none",

		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍"
		}
	},

	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4
}

require("mason").setup(settings)

local servers = {
  "elixirls",
	"jsonls",
	"lua_ls",
	"pyright"
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
  local handlers_ok, handlers = pcall(require, "fabioueno.lsp.handlers")
  if not handlers_ok then
    return
  end

	opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities
	}

	server = vim.split(server, "@")[1]

	local settings_ok, settings = pcall(require, "user.lsp.settings." .. server)
	if settings_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
