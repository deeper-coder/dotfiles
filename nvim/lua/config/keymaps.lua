-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- 文件操作相关快捷键 ------------------------------------------
-- 删除当前文件全部内容
map("n", "die", "ggVGd", { desc = "删除整个文件内容" })

-- 复制当前文件全部内容 
map("n", "yie", "ggVGd", { desc = "复制整个文件内容" })

-- 剪切板操作相关快捷键 ---------------------------------------
-- 普通模式下,使用 d 和 x 删除内容时不复制到剪切板
map("n", "d", '"_d', { desc = "删除内容(不复制到剪切板)" })
map("n", "x", '"_x', { desc = "剪切内容(不复制到剪切板)" })

-- 可视模式下,使用 d 和 x 删除内容时不复制到剪切板
map("v", "d", '"_d', { desc = "删除内容(不复制到剪切板)" })
map("v", "x", '"_x', { desc = "剪切内容(不复制到剪切板)" })
