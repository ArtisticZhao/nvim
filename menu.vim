call quickui#menu#reset()
call quickui#menu#install("&File", [
            \ [ "&Open\t(:w)", 'call feedkeys(":tabe ")'],
            \ [ "&Save\t(:w)", 'write'],
            \ ])

call quickui#menu#install("&Telescope", [
            \ ["Find &Files\t(<l>ff)", 'call feedkeys(":Telescope find_files\n")'],
            \ ["Find &in Files\t(<l>fg)", 'call feedkeys(":Telescope live_grep\n")'],
            \ ["Find &buffers\t(<l>fb)", 'call feedkeys(":Telescope buffers\n")'],
            \ ])
nnoremap <silent><c-space> :call quickui#menu#open()<cr>
