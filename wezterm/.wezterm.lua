-- WezTerm 配置文件
-- ===================================================

-- 导入 wezterm API
local wezterm = require("wezterm")

-- 创建配置表
local config = {}

-- 使用新版本的配置构建器以获得更清晰的错误信息
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- ===================================================
-- 基础外观设置
-- ===================================================

-- 配色方案
config.color_scheme = "Ir Black (Gogh)" 

-- 字体设置
config.font = wezterm.font("JetBrainsMono Nerd Font")  -- 使用 JetBrains Mono 字体，支持 Nerd Font 图标
config.font_size = 15.5  -- 字体大小

-- ===================================================
-- 窗口设置
-- ===================================================

-- 窗口基础属性
config.initial_cols = 140  -- 初始窗口宽度（字符数）
config.initial_rows = 35   -- 初始窗口高度（字符数）
config.window_decorations = "RESIZE"  -- 窗口装饰样式：只显示调整大小按钮

-- 窗口外观
config.window_background_opacity = 0.8  -- 窗口背景透明度（0-1）
config.macos_window_background_blur = 10  -- macOS 窗口背景模糊度
config.window_close_confirmation = "NeverPrompt"  -- 关闭窗口时不显示确认提示

-- 窗口启动行为
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    -- window:gui_window():set_position(250, 200)  -- 设置窗口初始位置
    window:gui_window():maximize()  -- 启动时最大化窗口
end)

-- ===================================================
-- 标签栏设置
-- ===================================================

config.hide_tab_bar_if_only_one_tab = false  -- 即使只有一个标签页也显示标签栏
config.tab_bar_at_bottom = true  -- 将标签栏放置在窗口底部
config.use_fancy_tab_bar = false  -- 使用简单的标签栏样式
config.tab_and_split_indices_are_zero_based = false  -- 标签页和分割窗格的编号从1开始

-- ===================================================
-- 快捷键设置
-- ===================================================

-- Leader 键配置
config.leader = {
    key = "q",  -- 使用 q 作为 Leader 键
    mods = "ALT",  -- 需要同时按住 ALT
    timeout_milliseconds = 2000  -- Leader 键超时时间
}

-- 快捷键映射
config.keys = {
    -- 命令行文本编辑
    {
        key = "LeftArrow",
        mods = "CMD",
        action = wezterm.action.SendString("\x01")  -- CMD + ← 跳转到行首
    },
    {
        key = "RightArrow",
        mods = "CMD",
        action = wezterm.action.SendString("\x05")  -- CMD + → 跳转到行尾
    },
    {
        key = "Backspace",
        mods = "CMD",
        action = wezterm.action.SendString("\x15")  -- CMD + Backspace 删除整行
    },
    
    -- 标签页操作
    {
        mods = "LEADER",
        key = "c",
        action = wezterm.action.SpawnTab("CurrentPaneDomain")  -- Leader + c 新建标签页
    },
    {
        mods = "LEADER",
        key = "x",
        action = wezterm.action.CloseCurrentPane({confirm = true})  -- Leader + x 关闭当前窗格
    },
    {
        mods = "LEADER",
        key = "b",
        action = wezterm.action.ActivateTabRelative(-1)  -- Leader + b 切换到上一个标签
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.ActivateTabRelative(1)  -- Leader + n 切换到下一个标签
    },
    
    -- 窗格分割操作
    {
        mods = "LEADER",
        key = "]",
        action = wezterm.action.SplitPane({
            direction = "Right",
            size = { Percent = 50 },
        })  -- Leader + ] 向右分割
    },
    {
        mods = "LEADER",
        key = "[",
        action = wezterm.action.SplitPane({
            direction = "Left",
            size = { Percent = 50 },
        })  -- Leader + [ 向左分割
    },
    {
        mods = "LEADER",
        key = "_",
        action = wezterm.action.SplitPane({
            direction = "Down",
            size = { Percent = 50 },
        })  -- Leader + _ 向下分割
    },
    {
        mods = "LEADER",
        key = "-",
        action = wezterm.action.SplitPane({
            direction = "Up",
            size = { Percent = 50 },
        })  -- Leader + - 向上分割
    },
}

-- ===================================================
-- 智能分割插件配置
-- ===================================================

local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
smart_splits.apply_to_config(config, {
    -- 方向键设置（vim 风格）
    direction_keys = { 'h', 'j', 'k', 'l' },
    
    -- 快捷键修饰符设置
    modifiers = {
      move = 'CTRL',   -- CTRL + hjkl 在窗格间移动
      resize = 'CMD',  -- ALT + hjkl 调整窗格大小
    },
    
    -- 日志级别
    log_level = 'info'
})

-- ===================================================
-- 标签页快速切换
-- ===================================================

-- 添加标签页快速切换快捷键 (Leader + 1-9)
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i - 1)
    })
end

-- ===================================================
-- 状态栏设置
-- ===================================================

wezterm.on("update-right-status", function(window, _)
    -- 状态栏样式定义
    local SOLID_LEFT_ARROW = ""
    local ARROW_FOREGROUND = {
        Foreground = {
            Color = "#c6a0f6"
        }
    }
    local prefix = ""

    -- Leader 键状态显示
    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f30a)  -- 显示海浪表情
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    end

    -- 标签状态颜色
    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = {
            Foreground = {
                Color = "#1e2030"
            }
        }
    end

    -- 设置状态栏样式
    window:set_left_status(wezterm.format({
        {
            Background = {
                Color = "#b7bdf8"
            }
        },
        {
            Text = prefix
        },
        ARROW_FOREGROUND,
        {
            Text = SOLID_LEFT_ARROW
        }
    }))
end)

-- 返回配置
return config
