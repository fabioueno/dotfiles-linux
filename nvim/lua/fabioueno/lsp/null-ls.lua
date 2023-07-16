local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
local completion   = null_ls.builtins.completion
local diagnostics  = null_ls.builtins.diagnostics
local formatting   = null_ls.builtins.formatting

null_ls.setup({
	debug = false,

	sources = {
    code_actions.gitsigns,
    code_actions.refactoring,
    completion.luasnip,
    completion.vsnip,
    diagnostics.credo,
    diagnostics.flake8,
    diagnostics.jsonlint,
    diagnostics.mypy,
    diagnostics.pycodestyle,
    diagnostics.pylint,
    diagnostics.ruff,
    diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
    formatting.autoflake,
    formatting.autopep8,
    formatting.black,
    formatting.isort,
    formatting.jq,
    formatting.pg_format,
    formatting.ruff,
    formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } })
	}
})
