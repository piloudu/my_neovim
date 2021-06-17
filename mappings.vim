" Define leaderkey
let mapleader = " "  

" ============ N O R M A L   M O D E ===============
" Basic mappings
nmap <Leader>qq :q<cr>| " Quit file
nmap <Leader>wq :wq<cr>| " Save and quit file
nmap <Leader>w :w<cr>| " Save file
nmap <Leader>ss :noh<cr>| " Undo highlinghting after search
nmap <Leader>t :! | " cr Terminal mode
nmap <Leader>o o<Esc>| " Insert line below and stay normal mode.
nmap <Leader>O O<Esc>| " Insert line below and stay normal mode.
nmap <expr> <Leader>m ":'" . input("Marker: ") . "<cr>"| " Move to the specified marker
nmap <Leader>i i<space><esc>| " insert space before cursor

" Easymotion pluggin
nmap <Leader>esm <Plug>(easymotion-s2)

" NerdTree pluggin
nmap <Leader>nth :NERDTree<cr>| " Shortcut to NERDTree
nmap <Leader>ntx :NERDTreeFromBookmark xoan<cr>| " NERDTree from marker xoan
nmap <Leader>ntm :NERDTreeFromBookmark Master<cr>| " Shortcut to Master folder
" nmap <Leader>h :help NERDTree<cr>216j | " Display NERDTree help in the command section

" FZF pluggin
nmap <Tab><Tab> :Files ~<cr>| " Search files from ~
nmap <Leader>fzh :Files<cr>| " Search files from .
nmap <Leader>fzs :Rg<cr>| " Search pattern 

" COC plugin
nmap <space>cs :CocSearch | " Search pattern with CocSearch


" Run file in python
autocmd FileType python nmap <Leader>pp :w<cr>:!python %<cr>| " Run file in python3
" autocmd FileType python nmap <Leader>pp :w !python3<cr>| " Run file in python3 
autocmd FileType python nmap <Leader>PP :w<cr>:term python '%:p'<cr>| " Run file in python3 with available prompt
"autocmd FileType python nmap <Leader>ph :w!<cr>Vgg:term python '%:p'<cr>| " Run the selected lines in python

" Search and replace
nmap <expr> <Leader>sra ":%s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<cr>"| " Search for given text and replace with next given text in the hole file. (The . concatenates functions)
nmap <expr> <Leader>srl ":" . input("First line: ") . "," . input("Last line: ") . "s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<cr>"| " Search for given text and replace with next given text in the specified lines
"nmap <expr> <Leader>srl ":let first_line = input("First line: ")<cr>" . ":let n_lines = input("Number of lines : ")<cr>" . ":" . first_line "," first_line + n_lines . "s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<cr>"| " Search for given text and replace with next given text in the specified lines
nmap <expr> <Leader>srh ":" . "s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<cr>"| " Search for given text and replace with next given text in the current line
nmap <expr> <Leader>sre ":,$s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<cr>"| " Search and replace from current line to EOF

" Comment and uncomment
nmap <Leader>cmh 0i#<Esc>| " Comment the current line
nmap <Leader>cme 0<C-v>GI#<Esc>| " Comment till the end of file
nmap <expr> <Leader>cml "0<C-v>" . input("End line: ") . "jI#<Esc>"| " Comment from current line to selected line
nmap <Leader>uch 0x| " Uncomment the current line
nmap <Leader>uce 0<C-v>Gx| " Uncomment till the end of file
nmap <expr> <Leader>ucl "0<C-v>" . input("End line: ") . "jx"| " Uncomment from current line to selected line

" Tabulate and untabulate
nmap <Leader>tbh 0i<Tab><Esc>| " Tabulate the current line
nmap <Leader>tbe 0<C-v>GI<Tab><Esc>| " Tabulate till EOF
nmap <expr> <Leader>tbl "0<C-v>" . input("End line: ") . "jI<Tab><Esc>"| " Tabulate the specified lines
nmap <Leader>uth 0<C-v>3lx| " Untabulate the current line
nmap <Leader>ute 0<C-v>G3lx| " Untabulate till EOF
nmap <expr> <Leader>utl "0<C-v>" . input("End line: ") . "j3lx"| " Untabulate the specificed lines


" ============ I N S E R T   M O D E ===============
imap <C-j> <C-p>| " Used to move up and down in Kite completions
imap Ñ <cr>| " New line
:imap ,, <Esc>| " Redefine ',,' as the 'Esc' key:

" ============ V I S U A L   M O D E ===============
xnoremap <space>p :w !python<cr>| " Run the selected lines in python (visual mode).
xnoremap <space>pp :w!<cr>:term python '%:p'<cr>| " Run the selected lines in python
xnoremap <space>i I<space><esc>| " insert a space before cursor

" ============ T E R M I N A L   M O D E ===============
:tnoremap <Esc> <C-\><C-n>| " Allow to Esc the window popped using :term python using the insert shortcut to Esc.


" --------- L a t e X --------- "

" Compile
autocmd FileType tex nmap <expr> <space>pp ':w<cr>\ll'

" Insert {} after <This>
autocmd FileType tex imap <C-b><C-r> {}<Esc>i

" Insert {}{} after <This>
autocmd FileType tex imap <C-b><C-b><C-r><C-r> {}{}<Esc>2hi

" Autoinsert $$ when $ is used
autocmd FileType tex inoremap $ $$<Esc>i

" \left and \right expresions
autocmd FileType tex inoremap <C-l><C-r> <Esc>hxa\left<C-R>"<Esc>6hxA\right<C-R>"<Esc>6hi

" Begin <This>
autocmd FileType tex noremap <space>bt bcw\begin{<C-R>"}<CR>\end{<C-R>"}<ESC>O

" Begin equation
autocmd FileType tex nmap <space>beq i\begin{equation}<CR>\end{equation}<ESC>O

" Begin equation labeled
autocmd FileType tex nmap <expr> <space>bel 'i\begin{equation}<space>\label{eq' . input("Eq. number : ") . '}<CR>\end{equation}<ESC>O'

" Begin figure
autocmd FileType tex nmap <expr> <space>bf 'i\begin{figure}[h!]<CR>\centering<CR>\includegraphics[width = ' . input("Width : ") . '\linewidth, height = ' . input("Height (cm) : ") . 'cm]{}<CR>\caption{}<CR>\label{}<CR>\end{figure}<ESC>'
