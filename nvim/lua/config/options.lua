-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Equivalencias de tu settings.json de VSCode
opt.wrap = true -- editor.wordWrap: on
opt.scrolloff = 8 -- editor.cursorSurroundingLines: 8
opt.colorcolumn = "88,120" -- editor.rulers (ruff/black + límite general)
opt.list = true -- editor.renderWhitespace: boundary
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Portapapeles del sistema (vim.useSystemClipboard)
opt.clipboard = "unnamedplus"
