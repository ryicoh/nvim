set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=200
set shortmess+=c
set signcolumn=yes
set viminfo='1000
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start
set clipboard=unnamed
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set termguicolors
set wildignore+=*node_modules/**
set wildignore+=*vendor/**

lang en_US.UTF-8

let g:netrw_banner=0
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1


command! W  w
command! Q  q
cabb W w
cabb Q q
map Q <Nop>

nnoremap <leader>ve :<C-u>e ~/.config/nvim/init.vim<CR>
nnoremap <leader>vd :<C-u>e ~/.config/nvim/dein.toml<CR>
nnoremap <leader>vs :<C-u>source ~/.config/nvim/init.vim<CR>
nnoremap <leader>so :<C-u>source ~/.config/nvim/init.vim<CR>
nnoremap z<CR> 5kz<CR>5j
nnoremap zb 5jzb5k
nnoremap <C-f> 5k<C-f>5j
nnoremap <C-b> 5j<C-b>5k
nnoremap g<C-o> :<C-u>Back<CR>
nnoremap g<C-i> :<C-u>Forward<CR>
nnoremap <silent><nowait> <space>/  :<C-u>set nohlsearch<CR>
nnoremap <silent><nowait> <space>u  :<C-u>GitGutterUndoHunk<CR>
nnoremap <silent><nowait> <space>n  :<C-u>GitGutterNextHunk<CR>
nnoremap <silent><nowait> <space>p  :<C-u>GitGutterPrevHunk<CR>
nnoremap <space>t  :<C-u>tabnew<CR>
nnoremap <space>[  gT
nnoremap <space>]  gt
noremap <space>1 1gt
noremap <space>2 2gt
noremap <space>3 3gt
noremap <space>4 4gt
noremap <space>5 5gt
noremap <space>6 6gt
noremap <space>7 7gt
noremap <space>8 8gt
noremap <space>9 9gt
noremap <space>0 :<C-U>tablast<CR>

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
