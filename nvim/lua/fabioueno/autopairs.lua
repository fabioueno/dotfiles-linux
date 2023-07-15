local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  check_ts = true,

  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" }
  },

  disable_filetype = { "TelescopePrompt", "spectre_panel" },

  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr"
  }
}

npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local autopairs_cmp_ok, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
if not autopairs_cmp_ok then
  return
end

cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done { map_char = { tex = "" }})
