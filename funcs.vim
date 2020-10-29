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


" =====================================================
" function:    Is_emptytab
" description: check current tab is empty
" return:      empty tab will return 1 
" call:        
" =====================================================

function! Is_emptytab()
    " Remember which window we're in at the moment
    let initial_win_num = tabpagenr()
    echo initial_win_num
    let win_count = 0
    " Add the length of the file name on to count:
    " this will be 0 if there is no file name
    windo let win_count += len(expand('%'))

    " Go back to the initial window
    exe initial_win_num . "wincmd w"

    " Check count
    if win_count == 0
        " Tab page is empty
        return 1
    else
        return 0
    endif
endfunction
