local G = require('G')
print('in keymap')
---- set space as leader key
vim.g.mapleader = " "

-------------------- navigation --------------------
G.map{'n', 'J', '5j'}
G.map{'n', 'K', '5k'}
G.map{'n', 'H', '^' }
G.map{'n', 'L', 'g_'}

G.map{'i', '<c-h>', '<left>' }
G.map{'i', '<c-j>', '<down>' }
G.map{'i', '<c-k>', '<up>'   }
G.map{'i', '<c-l>', '<right>'}


-------------------- save & quit --------------------
G.map{'n', '<c-q>', ':q<enter>' }
G.map{'n', '<c-s>', ':w<enter>' }
G.map{'i', '<c-s>', '<esc>:w<enter>' }
G.map{'x', '<c-s>', '<esc>:w<enter>' }
G.map{'v', '<c-s>', '<esc>:w<enter>' }


-------------------- copy & paste -------------------
G.map{'v', 'Y', '"+y'  }
G.map{'n', 'Y', '"+yy' }
G.map{'n', 'P', '"+p'  }
G.map{'v', 'p', 'pgvy' }  -- Don't lose clipboard when pasting


-------------------- search       -------------------
-- TODO open search quickfix

G.map{ 'n', 'n', '/<CR>zz', {silent = true} }  -- search next
G.map{ 'n', 'N', '?<CR>zz', {silent = true} }  -- search prev
-- next/prev fx Fx
G.map{ 'n', '-', ','  }
G.map{ 'n', '=', ';'  }
G.map{ 'n', '<leader><enter>', '<cmd>nohlsearch<enter>' }

--------------------  split windows -----------------
-- create split window
G.map{'n', '<leader>sl', ':set splitright<enter>:vsplit<enter>' }
G.map{'n', '<leader>sh', ':set nosplitright<enter>:vsplit<enter>' }
G.map{'n', '<leader>sk', ':set nosplitbelow<enter>:split<enter>' }
G.map{'n', '<leader>sj', ':set splitbelow<enter>:split<enter>' }

G.map{'n', '<leader>s=', '<c-w>=' }
-- move around splited windows
G.map{'n', '<leader>h', '<c-w>h' }
G.map{'n', '<leader>j', '<c-w>j' }
G.map{'n', '<leader>k', '<c-w>k' }
G.map{'n', '<leader>l', '<c-w>l' }


--------------------  MISC --------------------------
G.map{'n', '<enter>', ':a<enter><enter>.<enter>'}  -- add an empty line
G.map{'n', '`', '~' }  -- change uppercase
G.map{'n', '<leader>R', "<cmd>lua ReloadConfig()<enter>"}
