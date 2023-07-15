local options = {
  backup = false,                          -- Creates a backup file
  clipboard = "unnamedplus",               -- Allows Neovim to access the system clipboard
  cmdheight = 2,                           -- More space in the Neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- Mostly just for cmp
  conceallevel = 0,                        -- So that `` is visible in markdown files
  fileencoding = "utf-8",                  -- The encoding written to a file
  hlsearch = true,                         -- Highlight all matches on previous search pattern
  ignorecase = true,                       -- Ignore case in search patterns
  mouse = "a",                             -- Allow the mouse to be used in Neovim
  pumheight = 10,                          -- Pop up menu height
  showmode = false,                        -- We don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- Always show tabs
  smartcase = true,                        -- Smart case
  smartindent = true,                      -- Make indenting smarter again
  splitbelow = true,                       -- Force all horizontal splits to go below current window
  splitright = true,                       -- Force all vertical splits to go to the right of current window
  swapfile = false,                        -- Creates a swapfile
  termguicolors = true,                    -- Set Term GUI colors (most terminals support this)
  timeoutlen = 300,                        -- Time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- Enable persistent undo
  updatetime = 300,                        -- Faster completion (4000ms default)
  writebackup = false,                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- Convert tabs to spaces
  shiftwidth = 2,                          -- The number of spaces inserted for each indentation
  tabstop = 2,                             -- Insert 2 spaces for a tab
  cursorline = true,                       -- Highlight the current line
  number = true,                           -- Set numbered lines
  relativenumber = true,                   -- Set relative numbered lines
  numberwidth = 2,                         -- Set number column width to 2 (default 4)

  signcolumn = "yes",                      -- Always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- Display lines as one long line
  linebreak = true,                        -- Companion to wrap, don't split words
  scrolloff = 8,                           -- Minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                       -- Minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "monospace:h17",               -- The font used in graphical Neovim applications
  whichwrap = "bs<>[]hl",                  -- Which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- Flags to shorten Vim messages, see :help 'shortmess'

vim.opt.shortmess:append "c"                           -- Don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- Hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- Separate Vim plugins from Neovim in case Vim still in use
