
" ==============================================
" ============== markdown   ====================
" ==============================================
" # 这里采用setlocal只对当前打开markdown的buffer有效，而对全局无效
" # 否则就会出现如果打开了markdown文件之后，再打开其他文件也是tab=2 space的设置
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
autocmd FileType markdown setlocal wrap
" find a placeholder
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
" bold
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
" delete line
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
" italic
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
" code in line
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
" code block
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
" place a 'more'
autocmd Filetype markdown inoremap <buffer> ,m <!--more-->
