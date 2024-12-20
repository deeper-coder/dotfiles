-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- 删除当前文件全部内容
map("n", "die", "ggVGd", { desc = "Delete entire file" })

-- 复制当前文件全部内容
map("n", "yie", "ggVGd", { desc = "Yank entire file" })

-- 设置普通模式的删除 (d) 和剪切 (x) 不拷贝到剪贴板
map("n", "d", '"_d', { desc = "Delete without yanking" })
map("n", "x", '"_x', { desc = "Cut without yanking" })

-- 视觉模式下的删除和剪切不拷贝到剪贴板
map("v", "d", '"_d', { desc = "Delete without yanking" })
map("v", "x", '"_x', { desc = "Cut without yanking" })
