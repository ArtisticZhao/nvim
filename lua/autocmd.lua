local G = require('G')

-- custom filetype
G.cmd([[ au BufNewFile,BufRead *.vh set filetype=verilog ]])
G.cmd([[ au BufNewFile,BufRead *.exp set filetype=tcl ]])

-- open file with last edit postion
G.cmd([[ autocmd BufReadPost * normal! g`" ]])
