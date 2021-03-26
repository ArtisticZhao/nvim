
" ==============================================
" ============== markdown   ====================
" ==============================================
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
autocmd FileType markdown set wrap
" find a placeholder
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
" bold
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
" delete line
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
" italic
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
" code in line
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
" code block
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
" place a 'more'
autocmd Filetype markdown inoremap ,m <!--more-->
