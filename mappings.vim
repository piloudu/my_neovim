" Define leaderkey
let mapleader = " "  

" Mappings for normal mode
nmap <space>qq :q<Enter>| " Quit file
nmap <space>wq :wq<Enter>| " Save and quit file
nmap <space>w :w<Enter>| " Save file
nmap ss :noh<Enter>| " Undo highlinghting after search
nmap <space>j <C-w>w| " Swipe window
nmap <space>t :! | " Enter Terminal mode
nmap <space>o o<Esc>| " Insert line below and stay normal mode.
nmap <space>O O<Esc>| " Insert line below and stay normal mode.
nmap <expr> <space>m ":'" . input("Marker: ") . "<Enter>"| " Move to the specified marker
nmap <space>i i<space><esc>| " insert space before cursor

nmap <space>nth :NERDTree<Enter>| " Shortcut to NERDTree
nmap <space>ntx :NERDTreeFromBookmark xoan<Enter>| " NERDTree from marker xoan
nmap <space>ntm :NERDTreeFromBookmark Master<Enter>| " Shortcut to Master folder
nmap <space>h :help NERDTree<Enter>216j | " Display NERDTree help in the command section

autocmd FileType python nmap <space>pp :w<Enter>:!python %<Enter>| " Run file in python3
" Modified to work on different environments
" autocmd FileType python nmap <space>pp :w !python3<Enter>| " Run file in python3 
autocmd FileType python nmap <space>PP :w<Enter>:term python '%:p'<Enter>| " Run file in python3 with available prompt
"autocmd FileType python nmap <space>ph :w!<Enter>Vgg:term python '%:p'<Enter>| " Run the selected lines in python
"
nmap <expr> <space>sra ":%s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<Enter>"| " Search for given text and replace with next given text in the hole file. (The . concatenates functions)
nmap <expr> <space>srl ":" . input("First line: ") . "," . input("Last line: ") . "s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<Enter>"| " Search for given text and replace with next given text in the specified lines
"nmap <expr> <space>srl ":let first_line = input("First line: ")<Enter>" . ":let n_lines = input("Number of lines : ")<Enter>" . ":" . first_line "," first_line + n_lines . "s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<Enter>"| " Search for given text and replace with next given text in the specified lines
nmap <expr> <space>srh ":" . "s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<Enter>"| " Search for given text and replace with next given text in the current line
nmap <expr> <space>sre ":,$s/" . input("Search: ") . "/" . input("Replace: ") . "/gc" . "<Enter>"| " Search and replace from current line to EOF

nmap <space>cmh 0i#<Esc>| " Comment the current line
nmap <space>cme 0<C-v>GI#<Esc>| " Comment till the end of file
nmap <expr> <space>cml "0<C-v>" . input("End line: ") . "jI#<Esc>"| " Comment from current line to selected line
nmap <space>uch 0x| " Uncomment the current line
nmap <space>uce 0<C-v>Gx| " Uncomment till the end of file
nmap <expr> <space>ucl "0<C-v>" . input("End line: ") . "jx"| " Uncomment from current line to selected line

nmap <space>tbh 0i<Tab><Esc>| " Tabulate the current line
nmap <space>tbe 0<C-v>GI<Tab><Esc>| " Tabulate till EOF
nmap <expr> <space>tbl "0<C-v>" . input("End line: ") . "jI<Tab><Esc>"| " Tabulate the specified lines
nmap <space>uth 0<C-v>3lx| " Untabulate the current line
nmap <space>ute 0<C-v>G3lx| " Untabulate till EOF
nmap <expr> <space>utl "0<C-v>" . input("End line: ") . "j3lx"| " Untabulate the specificed lines

" Mappings for insert mode
imap <C-j> <C-p>| " Used to move up and down in Kite completions
imap Ñ <Enter>| " New line
:imap ,, <Esc>| " Redefine ',,' as the 'Esc' key:

" Mappings for visual mode
xnoremap <space>p :w !python<cr>| " Run the selected lines in python (visual mode).
xnoremap <space>pp :w!<Enter>:term python '%:p'<cr>| " Run the selected lines in python
xnoremap <space>i I<space><esc>| " insert a space before cursor

" Mappings for terminal mode
:tnoremap <Esc> <C-\><C-n>| " Allow to Esc the window popped using :term python using the insert shortcut to Esc.


" --------- L a t e X --------- "

" Compile
autocmd FileType tex nmap <expr> <space>pp ':w<Enter>\ll'

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
