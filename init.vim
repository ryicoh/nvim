set runtimepath+=/Users/ryicoh/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/ryicoh/.cache/dein')
  call dein#begin('/Users/ryicoh/.cache/dein')

  let s:toml_dir = expand('~/.config/nvim')
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

source /Users/ryicoh/.config/nvim/vim.vim

if dein#check_install()
  call dein#install()
endif
