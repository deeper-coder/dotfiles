-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.spell = false
opt.wrap = true
opt.guifont = { "CaskaydiaCove Nerd Font", "Source Han Sans CN", "微软雅黑", "Maple Mono SC NF", ":h13" }
opt.timeoutlen = vim.g.vscode and 300 or 300
-- opt.winbar = "%=%m %f"
-- vim.g.lazyvim_picker = "telescope"
