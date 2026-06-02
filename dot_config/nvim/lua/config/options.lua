local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 10
opt.wrap = false

opt.splitright = true
opt.splitbelow = true

-- Persistent undo across sessions
opt.undofile = true

-- Faster CursorHold / gitsigns updates
opt.updatetime = 250

opt.clipboard = "unnamedplus"
