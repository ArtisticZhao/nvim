call quickui#menu#reset()

call quickui#menu#install("&Telescope", [
            \ ["Find &Files\t(<l>ff)", 'call feedkeys(":Telescope find_files\n")'],
            \ ["Find &in Files\t(<l>fg)", 'call feedkeys(":Telescope live_grep\n")'],
            \ ["Find &buffers\t(<l>fb)", 'call feedkeys(":Telescope buffers\n")'],
            \ ])
call quickui#menu#install("&Latex", [
            \ ["Toggle &Compile\t(\\ll)", 'call feedkeys(":VimtexCompile\n")'],
            \ ["&View PDF\t(\\lv F12)", 'call feedkeys(":VimtexView\n")'],
            \ ["View &TOC\t(\\lt)", 'call feedkeys(":VimtexTocToggle\n")'],
            \ ["&Clear auxiliary\t(\\lc)", 'call feedkeys(":VimtexClean\n")'],
            \ ], '<auto>', 'tex')
nnoremap <silent><c-space> :call quickui#menu#open()<cr>
