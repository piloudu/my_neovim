" __     _____ __  __   _       _
" \ \   / /_ _|  \/  | (_)___  | |    _____   _____
"  \ \ / / | || |\/| | | / __| | |   / _ \ \ / / _ \
"   \ V /  | || |  | | | \__ \ | |__| (_) \ V /  __/_
"    \_/  |___|_|  |_| |_|___/ |_____\___/ \_/ \___(_)
"

"      __  __               _
"     |  \/  |_   _  __   _(_)_ __ ___  _ __ ___
"     | |\/| | | | | \ \ / / | '_ ` _ \| '__/ __|
"     | |  | | |_| |  \ V /| | | | | | | | | (__
"     |_|  |_|\__, | (_)_/ |_|_| |_| |_|_|  \___|
"             |___/
"

" # ======= I N T E R F A C E ======= #
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/pluggins.vim

set nocompatible  " Disables this settings in VI
syntax enable  " Sets syntax colors visibles
colorscheme dracula
set mouse=r " (a) Allows the mouse to select and change the cursor position and (r) disaables this function
set clipboard=unnamedplus  " Allows to alternate between vim clipboard and general OS clipboard
set number  " (number) to view linenumbers and (number!) to disable
set relativenumber  " (relativenumber) to view relative number lines and (relativenumber!) to disable.
set incsearch
let g:python_host_prog="/usr/local/bin/python3.9" | " Activate python with nvim

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown| " Highlight for .md files

" # ============ T A B S ============ #

set shiftwidth=4  " Four spaces for <Tab>
set tabstop=4
set expandtab
set autoindent  " Preserves the indentation of the upper line when press <Return>
set encoding=UTF-8
filetype indent on


" " Shortcut to display information about the function under the cursor in
" " python
" nnoremap <buffer> ñ :<C-u>let save_isk = &iskeyword \|
"     \ set iskeyword+=. \|
"     \ execute "!pydoc " . expand("<cword>") \|
"     \ let &iskeyword = save_isk<CR>
