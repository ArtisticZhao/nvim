"   __                  _   _
"  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
" | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
" |  _| |_| | | | | (__| |_| | (_) | | | \__ \
" |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
"
"
" =====================================================
" command:    change directory to current file.
" =====================================================
command! CWD :cd %:h


" =====================================================
" function:    add something surround in V mode
" description:
" return:
" call:
" =====================================================
func! SurroundVaddPairs(left, right)
    let [c1, l1, c2, l2] = [col("'<"), line("'<"), col("'>"), line("'>")]
    let c2 = c2 + 1
    let [content1, content2] = [getline(l1), getline(l2)]
    if s:isSelectLines()
        let c = s:getCol(l1, l2)
        for num in range(l1, l2)
            let line = getline(num)
            call setline(num, s:getEmptyStr(&shiftwidth) . line)
        endfor
        echo [l1, l2]
        call appendbufline('%', l1 - 1, s:getEmptyStr(c) . a:left)
        call appendbufline('%', l2 + 1, s:getEmptyStr(c) . a:right)
    else
        if l1 == l2
            let content_1 = c1 - 2 >= 0 ? content1[: c1 - 2] : ''
            let content_2 = content1[c1 - 1: c2 - 2]
            let content_3 = content1[c2 - 1: ]
            call setline(l1, content_1 . a:left . content_2 . a:right . content_3)
        else
            let content1_1 = c1 - 2 >= 0 ? content1[: c1 - 2] : ''
            let content2_1 = c2 - 2 >= 0 ? content2[: c2 - 2] : ''
            let content1_2 = content1[c1 - 1:]
            let content2_2 = content2[c2 - 1:]
            call setline(l1, content1_1 . a:left . content1_2)
            call setline(l2, content2_1 . a:right . content2_2)
        endif
    endif
endf

func! s:getCol(n1, n2)
    let c = 999
    for num in range(a:n1, a:n2)
        let pre = getline(num)
        let after = substitute(pre, '^\s*', '', '')
        let c = trim(pre) ==# '' ? c : min([c, len(pre) - len(after)])
    endfor
    return c
endf

func! s:getEmptyStr(len)
    let str = ''
    for i in range(1, a:len)
        let str .= ' '
    endfor
    return str
endf

func! s:isSelectLines()
    return col("'<") == 1 && col("'>") == len(getline(line("'>"))) + 1
endf
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
                    \ --height=0.3
                    \ --width=0.8
                    \ --wintype=floating
                    \ --name=run_python
                    \ --position=bottomright
                    \ --autoclose=2
                    \ python3 %
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
