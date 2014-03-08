set shiftwidth=4 tabstop=4 expandtab softtabstop=4
set sw=4 et sts=4

"set autoindent ignorecase incsearch showmatch smartindent
set ai ic incsearch sm si

"in order to convert W to w while giving :W command to save file
cmap W w
"in order to convert Q to q while giving :Q command to quit from editor
cmap Q q

"some mappings for split window in vi editor
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"to display tab characters and trailing spaces by pressing ,s
set listchars=tab:>-,trail:.

" by typing usedd will convert to use Data::Dumper

ab usedd use Data::Dumper;

"mapping for syntax check for current file
map <F4> <esc>:! perl -c %<Enter>
"to run current file using perl
map <F5> <esc>:! perl %<Enter>
 
" to convert splitted window from vertical to horizontal split
map <F6> <esc>:windo wincmd K<Enter>
" to convert splitted window from horizontal to vertical split
map <F7> <esc>:windo wincmd H<Enter>

"to indent selected text by pressing tab key
vmap <tab> >gv
"to un-indent selected text by pressing shift + tab key
vmap <s-tab> <gv

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F8>
