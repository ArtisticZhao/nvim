setlocal shiftwidth=2
setlocal wrap
vmap <buffer> <c-b> di\textbf{<c-r>"}<ESC>

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

" quick label
inoremap <buffer>`1 \section{}<esc>i
inoremap <buffer>`2 \subsection{}<esc>i
inoremap <buffer>`3 \subsubsection{}<esc>i
inoremap <buffer>`4 \subsubsubsection{}<esc>i

" quick ref
inoremap <buffer><c-f> \figurename{} \ref{}<esc>i
inoremap <buffer><c-t> \tablename{} \ref{}<esc>i

