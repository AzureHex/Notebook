" vim settings
set wrap
set ruler
set number
set mouse=a
set showcmd
set nobackup
set hlsearch
set incsearch
set linebreak
set ignorecase
set noswapfile
set smartindent
set nocursorline
set nocursorcolumn
set encoding=UTF-8

let data_dir = has('win32') || has('win64') ? '$HOME\vimfiles' : '~/.vim'
if empty(glob(data_dir.'/autoload/plug.vim'))
  if has('win32') || has('win64')
    silent execute '!powershell -Command "New-Item -Path "'.data_dir.' -Name autoload -Type Directory -Force; Invoke-WebRequest -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile '.data_dir.'\autoload\plug.vim"'
  else
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Plugins
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

