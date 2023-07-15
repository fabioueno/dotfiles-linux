local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

indent_blankline.setup({
  char = "▏",
	space_char_blankline = " ",

  show_first_indent_level = true,
  show_trailing_blankline_indent = false,
	show_end_of_line = true,

	char_highlight_list = {
	  "IndentBlanklineIndent1",
	  "IndentBlanklineIndent2"
  },

	space_char_highlight_list = {
	  "IndentBlanklineIndent1",
	  "IndentBlanklineIndent2"
  },

	show_current_context = true,
	show_current_context_start = true,

  use_treesitter = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type"
  }
})
