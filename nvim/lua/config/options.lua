-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- 基础编辑器设置
opt.wrap = true                -- 启用自动换行
opt.spell = false             -- 关闭拼写检查

-- 字体设置
opt.guifont = {               -- GUI字体配置
  "CaskaydiaCove Nerd Font",  -- 主要英文字体
  "Source Han Sans CN",       -- 中文字体
  "微软雅黑",                 -- 备选中文字体 
  "Maple Mono SC NF",         -- 备选等宽字体
  ":h13"                      -- 字体大小
}

-- 按键超时设置
opt.timeoutlen = vim.g.vscode and 300 or 300  -- 按键序列超时时间(毫秒)

-- 界面显示设置(已注释)
-- opt.winbar = "%=%m %f"     -- 窗口栏显示格式
-- vim.g.lazyvim_picker = "telescope"  -- 选择器设置
