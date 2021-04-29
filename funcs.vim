"   __                  _   _
"  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
" | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
" |  _| |_| | | | | (__| |_| | (_) | | | \__ \
" |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
"
"


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
" function:    Escaped Search
" description: Auto Escape the specal characters
" return:
" call:
" =====================================================
function! EscapedSearch() range
    " Backup what's in default register
    let l:saved_reg = @"
    " Copy selection
    execute 'normal! vgvy'
    " Escape special chars
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    " Set search
    let @/ = l:pattern
    " Restore default register
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

" ==============================================
" ============== Key Shortcuts =================
" ==============================================
" when work on kernel directory, always work on root directory
if (getcwd() == '/home/lilacsat/Playground/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek')
    echo "Work on kernel dir"
    set noautochdir
endif

" -------------- open device tree only work on kernel dir
function! OpenDeviceTree()
    if getcwd()=="/home/lilacsat/Playground/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek"
        :e ./arch/arm/boot/dts/imx6ull-alientek-emmc.dts
    else
        echo getcwd()
    endif
endfunction
map <LEADER>dt :call OpenDeviceTree()<CR>


" ==============================================
" ============== show highlight group ==========
" ==============================================
" press F2 to show hlgroup
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
map <F2> :call SynGroup()<CR>


" ==============================================
" ============== toggle coc-word ===============
" ==============================================
function! ToggleWord()
    if !exists("b:isword_enable")
        let b:isword_enable = 0
    endif
    if b:isword_enable == 1
        call coc#config('coc.source', {'word.enable': v:false})
        echo "coc word disable"
        let b:isword_enable = 0
    else
        call coc#config('coc.source', {'word.enable': v:true})
        echo "coc word enable"
        let b:isword_enable = 1
    endif
endfunction

map  <F3> :call ToggleWord()<CR>
imap <F3> <ESC>:call ToggleWord()<CR>gi


" ==============================================
" ============== run program ===================
" ==============================================
func! CompileRun()
    exec "w"
    if &filetype == 'python'
        :FloatermNew!
            \   --height=0.3 --width=0.8
            \   --wintype=floating
            \   --name=run_python
            \   --position=bottomright
            \   --autoclose=2
            \   python3 %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        :FloatermNew!
            \   --height=0.3 --width=0.8
            \   --wintype=floating
            \   --name=run_python
            \   --position=bottomright
            \   --autoclose=2
            \   xelatex %
    endif
endfunction
noremap <F5> :call CompileRun()<CR>
