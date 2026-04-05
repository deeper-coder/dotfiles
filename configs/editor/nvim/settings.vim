" lua require("config.lazy")

"VSCode
" 窗口管理
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" whichkey 启动设置 
nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>

set clipboard+=unnamedplus

"--使用退格键删除光标前一个字符（普通模式）
nnoremap <BS> i<BS><Esc>l
"--使用退格键删除光标前一个字符（可视模式）
" vnoremap <BS> di

nnoremap <silent> die ggVGd
nnoremap x "_x
vnoremap x "_x
nnoremap d "_d
vnoremap d "_ds
