"   __                  _   _
"  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
" | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
" |  _| |_| | | | | (__| |_| | (_) | | | \__ \
" |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
"
"
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


" ==============================================
" ============== Key Shortcuts =================
" ==============================================
" when work on kernel directory, always work on root directory
if (getcwd() == '/home/lilacsat/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek')
    echo "Work on kernel dir"
    set noautochdir
endif

" -------------- open device tree only work on kernel dir
function! OpenDeviceTree()
    if getcwd()=="/home/lilacsat/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek"
        :e ./arch/arm/boot/dts/imx6ull-alientek-emmc.dts
    else
        echo getcwd()
    endif
endfunction
map <LEADER>dt :call OpenDeviceTree()<CR>


" ==============================================
" ============== show highlight group ==========
" ==============================================
" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F2> :call SynGroup()<CR>


" ==============================================
" ============== run program ===================
" ==============================================
func! CompileRun()
	exec "w"
    if &filetype == 'python'
		set splitbelow
		:sp
        :res -10
		:term python3 %
    endif
endfunc
noremap <F5> :call CompileRun()<CR>
