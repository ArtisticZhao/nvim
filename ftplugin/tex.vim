setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal wrap

" 允许对multi_byte字符换行（否则默认只能空格或者英文标点，详见set breakat
setlocal formatoptions+=m
setlocal textwidth=78

" 在虚拟行之间移动
noremap <buffer> j gj
noremap <buffer> k gk
inoremap <buffer> <c-j> <C-[>g<Down>a
inoremap <buffer> <c-k> <C-[>g<Up>a

vnoremap <silent><buffer> <c-b> :<c-u>call SurroundVaddPairs("\\textbf{", "}")<cr>
vnoremap <silent><buffer> <c-m> :<c-u>call SurroundVaddPairs("$", "$")<cr>

nmap <buffer> <F12> \lv

" display vim messages in the textbox
function! DisplayMessages()
    let x = getreg('+')
    let x = substitute(x, '[\n\r]\+\%$', '', 'g')
    let content = filter(split(x, "\n"), 'v:key != ""')
    let opts = {"close":"button", "title":"Copyed Bibtex"}
    call quickui#textbox#open(content, opts)
    execute '!xclip -o >> reference.bib'
endfunc

" nmap <buffer> <F8> :!command xclip -o >> reference.bib<CR><CR>
nmap <buffer> <F8> :call DisplayMessages()<cr>
imap <buffer> <F8> <esc>:call DisplayMessages()<cr>
imap <buffer> <F9> \cite{}<esc>i<tab>

" quick label
inoremap <buffer>`1 \section{}<esc>i
inoremap <buffer>`2 \subsection{}<esc>i
inoremap <buffer>`3 \subsubsection{}<esc>i
inoremap <buffer>`4 \subsubsubsection{}<esc>i

" quick ref
inoremap <buffer><c-f> \figurename{} \ref{}<esc>i
inoremap <buffer><c-t> \tablename{} \ref{}<esc>i
inoremap <buffer><c-e> (\ref{})<esc><Left>i

