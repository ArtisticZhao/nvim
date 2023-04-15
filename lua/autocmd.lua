local G = require('G')

-- custom filetype
G.cmd([[ au BufNewFile,BufRead *.vh set filetype=verilog ]])
-- open file with last edit postion
G.cmd([[ autocmd BufReadPost * normal! g`" ]])
