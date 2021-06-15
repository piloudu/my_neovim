" # ======== P L U G I N S ========= #
" GitHub Page: https://github.com/junegunn/vim-plug
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" set rtp +=~/.vim added in order to make call plug#begin() work
set rtp +=~/.vim

" Now I call the plugins
call plug#begin('~/.config/nvim/plugged') " ('~/.vim/plugged')
Plug 'preservim/nerdtree' " File navigator
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " junegunn/fzf is a file searcher (BetaTech)
Plug 'junegunn/fzf.vim'
" Plug 'jupyter-vim/jupyter-vim'
Plug 'vim-airline/vim-airline' " nvim downbar plugin
Plug 'lervag/vimtex' "Plugin for Latex
Plug 'neoclide/coc.nvim' " coc-vim autocompletion
Plug 'dracula/vim', { 'name': 'dracula' } " dracula theme
" Plug 'davidhalter/jedi-vim'
" Plug 'mhinz/neovim-remote' " remote terminal access inside nvim
" Plug 'dense-analysis/ale' " syntax linting and fixing
call plug#end()

" NerdTree: https://github.com/preservim/nerdtree
" Help: https://jdhao.github.io/2018/09/10/nerdtree_usage/

"  P L U G I N  C O N F I G U R A T I O N

" Kite
" -------
let g:kite_supported_languages = ['python', 'javascript', 'go']
let g:kite_tab_complete=1 | "Allow autocompletions with Tab

" Latex-suite (vim-latex)
" -------
" filetype plugin on| " makes vim invoke Latex-Suite when open a .tex file
" filetype indent on| " enables the automatic identation
" let g:Tex_UsePython=0

" NERDTree
" -------
let NERDTreeShowHidden=1

" coc-vim
" -------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Airline
" -------
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='dracula'

" " Ale
" " -------
" let g:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']} " linters: highlight errors (flake8, pydocstyle, bandit and mypy have different functions)
" let g:ale_fixers = {'*': [], 'python': ['black', 'isort']} " fixers
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['black', 'isort'],
" \} " fixers (conditions bond to * apply to every type of file)
" let g:ale_fix_on_save = 1