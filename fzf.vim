" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:previewShell = "bat --style=numbers --color=always --line-range :500"
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --bind ctrl-b:page-up,ctrl-f:page-down,ctrl-u:up+up+up,ctrl-d:down+down+down"
let g:fzf_custom_options = ['--preview', previewShell.' {}']

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? History
    \ call fzf#vim#history({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? SearchHistory
    \ call fzf#vim#search_history({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? CommandHistory
    \ call fzf#vim#command_history({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!{node_modules,.git}" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

nnoremap <space>T :<C-u>Rg TODO:<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <space>f :<C-u>Files<CR>
nnoremap <silent> <C-p>    :<C-u>Files<cr>
nnoremap <silent> <space>h :<C-u>History<CR>
nnoremap <silent> <space>r :<C-u>Rg<CR>
" nnoremap <silent> <space>g :<C-u>GFiles?<CR>
nnoremap <silent> <space>b :<C-u>GBrowse<CR>
" nnoremap <silent> <space>s :<C-u>Gstatus<CR>
nnoremap <silent> <space>d :<C-u>Gdiff<CR>
nnoremap <silent> <C-_>    :<C-u>SearchHistory<CR>
nnoremap <silent> <space>l :<C-u>BLines<CR>
nnoremap <silent> <space>L :<C-u>Commits<CR>
nnoremap <silent> <space>c :<C-u>CommandHistory<CR>
nnoremap          <space>/ :<C-u>nohlsearch<CR>
nnoremap <silent> <space>: :<C-u>Commands<CR>
nnoremap <silent> <space>w :<C-u>Windows<CR>
nnoremap <silent> <space>m :<C-u>Marks<CR>
