" =====================================================
" function:    Term_toggle
" description: toggle the term in split windows
" return:      
" call:        
" =====================================================
" let g:term_buf = 0
" let g:term_win = 0
" function! Term_toggle(height)
"     if win_gotoid(g:term_win)
"         hide
"     else
"         botright new
"         exec 'resize ' . a:height
"         try
"             exec 'buffer ' . g:term_buf
"         catch
"             call termopen($SHELL, {"detach": 0})
"             let g:term_buf = bufnr("")
"         endtry
"         startinsert!
"         let g:term_win = win_getid()
"     endif
" endfunction


" =====================================================
" function:    is empty line
" description: this function will check line is empty
" return:      when line is empty will return 1
" call:        call at coc.vim to redefine the tab behavior
" =====================================================
function! Is_emptyline()
    let line=getline('.')
    if len(line)==0
        return 1
    endif
    return 0
endfunction
