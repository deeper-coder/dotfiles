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

-- 外观设置
-- ---------------------------------------------------
config.color_scheme = "Bamboo"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15.5

-- 窗口设置
-- ---------------------------------------------------
config.initial_cols = 140  -- 初始列数
config.initial_rows = 35   -- 初始行数
config.window_decorations = "RESIZE"  -- 窗口装饰样式
config.window_background_opacity = 0.8  -- 窗口背景透明度
config.macos_window_background_blur = 10  -- macOS 窗口背景模糊度
config.window_close_confirmation = "NeverPrompt"  -- 关闭窗口时不提示确认

-- 启动时设置窗口位置和大小
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    -- window:gui_window():set_position(250, 200)  -- 设置窗口位置
    window:gui_window():maximize()  -- 最大化窗口
end)

-- 标签栏设置
-- ---------------------------------------------------
config.hide_tab_bar_if_only_one_tab = false  -- 单标签时不隐藏标签栏
config.tab_bar_at_bottom = true  -- 标签栏位于底部
config.use_fancy_tab_bar = false  -- 不使用花哨的标签栏
config.tab_and_split_indices_are_zero_based = true  -- 标签和分割索引从0开始

-- 键盘设置
-- ---------------------------------------------------
-- Leader 键设置为 ALT + q，超时时间 2000 毫秒
config.leader = {
    key = "q",
    mods = "ALT",
    timeout_milliseconds = 2000
}

-- 快捷键配置
config.keys = {
    -- 命令行导航
    {
        key = "LeftArrow",
        mods = "CMD",
        action = wezterm.action.SendString("\x01")  -- 跳到行首
    },
    {
        key = "RightArrow",
        mods = "CMD",
        action = wezterm.action.SendString("\x05")  -- 跳到行尾
    },
    {
        key = "Backspace",
        mods = "CMD",
        action = wezterm.action.SendString("\x15")  -- 删除整行
    },
    
    -- 标签页管理
    {
        mods = "LEADER",
        key = "c",
        action = wezterm.action.SpawnTab("CurrentPaneDomain")  -- 新建标签页
    },
    {
        mods = "LEADER",
        key = "x",
        action = wezterm.action.CloseCurrentPane({confirm = true})  -- 关闭当前窗格
    },
    {
        mods = "LEADER",
        key = "b",
        action = wezterm.action.ActivateTabRelative(-1)  -- 切换到上一个标签
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.ActivateTabRelative(1)  -- 切换到下一个标签
    },
    
    -- 窗格分割
    {
        mods = "LEADER",
        key = "|",
        action = wezterm.action.SplitHorizontal({domain = "CurrentPaneDomain"})  -- 水平分割
    },
    {
        mods = "LEADER",
        key = "-",
        action = wezterm.action.SplitVertical({domain = "CurrentPaneDomain"})  -- 垂直分割
    },
    
    -- 窗格导航
    {
        mods = "LEADER",
        key = "h",
        action = wezterm.action.ActivatePaneDirection("Left")  -- 切换到左侧窗格
    },
    {
        mods = "LEADER",
        key = "j",
        action = wezterm.action.ActivatePaneDirection("Down")  -- 切换到下方窗格
    },
    {
        mods = "LEADER",
        key = "k",
        action = wezterm.action.ActivatePaneDirection("Up")  -- 切换到上方窗格
    },
    {
        mods = "LEADER",
        key = "l",
        action = wezterm.action.ActivatePaneDirection("Right")  -- 切换到右侧窗格
    },
    
    -- 窗格大小调整
    {
        mods = "LEADER",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize({"Left", 5})  -- 向左扩展
    },
    {
        mods = "LEADER",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize({"Right", 5})  -- 向右扩展
    },
    {
        mods = "LEADER",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize({"Down", 5})  -- 向下扩展
    },
    {
        mods = "LEADER",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize({"Up", 5})  -- 向上扩展
    }
}

-- 添加标签页快速切换快捷键 (0-9)
for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i)
    })
end

-- 状态栏设置
-- ---------------------------------------------------
wezterm.on("update-right-status", function(window, _)
    local SOLID_LEFT_ARROW = ""
    local ARROW_FOREGROUND = {
        Foreground = {
            Color = "#c6a0f6"
        }
    }
    local prefix = ""

    -- 当 Leader 键激活时显示海浪表情
    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f30a)
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    end

    -- 根据标签页状态改变箭头颜色
    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = {
            Foreground = {
                Color = "#1e2030"
            }
        }
    end

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
