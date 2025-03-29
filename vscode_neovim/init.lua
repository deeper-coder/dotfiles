-- VSCode 特定配置
if vim.g.vscode then
    -- 窗口导航快捷键
    local function map(mode, lhs, rhs, opts)
        local options = { noremap = true, silent = true }
        if opts then options = vim.tbl_extend('force', options, opts) end
        vim.keymap.set(mode, lhs, rhs, options)
    end

    -- 窗口管理快捷键
    local function vscode_cmd(cmd)
        return function() require('vscode-neovim').call(cmd) end
    end

    map('n', '<C-j>', vscode_cmd('workbench.action.navigateDown'))
    map('x', '<C-j>', vscode_cmd('workbench.action.navigateDown'))
    map('n', '<C-k>', vscode_cmd('workbench.action.navigateUp'))
    map('x', '<C-k>', vscode_cmd('workbench.action.navigateUp'))
    map('n', '<C-h>', vscode_cmd('workbench.action.navigateLeft'))
    map('x', '<C-h>', vscode_cmd('workbench.action.navigateLeft'))
    map('n', '<C-l>', vscode_cmd('workbench.action.navigateRight'))
    map('x', '<C-l>', vscode_cmd('workbench.action.navigateRight'))

    -- -- WhichKey 配置
    map('n', '<Space>', vscode_cmd('whichkey.show'))
    map('x', '<Space>', vscode_cmd('whichkey.show'))

    -- 系统剪贴板设置
    vim.opt.clipboard:append('unnamedplus')

    -- 退格键配置
    map('n', '<BS>', 'i<BS><Esc>l')

    -- 删除操作配置
    map('n', 'die', 'ggVGd')
    map('n', 'x', '"_x')
    map('v', 'x', '"_x')
    map('n', 'd', '"_d')
    map('v', 'd', '"_d')
end