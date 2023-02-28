local G = require('G')

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
-- open search quickfix
G.map{ 'n', '<leader>/', '<cmd>execute \'vimgrep /\'.@/.\'/g %\'<enter><cmd>copen<enter>', {silent = true} }
-- remap search direction
G.map{ 'n', 'n', '/<CR>zz', {silent = true} }  -- search next
G.map{ 'n', 'N', '?<CR>zz', {silent = true} }  -- search prev
-- next/prev fx Fx
G.map{ 'n', '-', ','  }
G.map{ 'n', '=', ';'  }
G.map{ 'n', '<leader><enter>', '<cmd>nohlsearch<enter>' }


--------------------  Indentation   -----------------
G.map{ 'n', '<', '<<' }
G.map{ 'n', '>', '>>' }
-- keep visual mode after change indentation
G.map{ 'v', '<', '<gv'}
G.map{ 'v', '>', '>gv'}


--------------------  Buffers       -----------------
G.map{ 'n', 'Q' , '<cmd>bd<enter>' }  -- close buffer
G.map{ 'n', ']b', '<cmd>bn<enter>' }  -- next buffer
G.map{ 'n', '[b', '<cmd>bN<enter>' }  -- prev buffer


--------------------  split windows -----------------
-- create split window
G.map{'n', '<leader>sl', ':set splitright<enter>:vsplit<enter>' }
G.map{'n', '<leader>sh', ':set nosplitright<enter>:vsplit<enter>' }
G.map{'n', '<leader>sk', ':set nosplitbelow<enter>:split<enter>' }
G.map{'n', '<leader>sj', ':set splitbelow<enter>:split<enter>' }
-- move around split windows
G.map{'n', '<leader>h', '<c-w>h' }
G.map{'n', '<leader>j', '<c-w>j' }
G.map{'n', '<leader>k', '<c-w>k' }
G.map{'n', '<leader>l', '<c-w>l' }
-- change split windows
G.map{'n', '<leader>s=', '<c-w>='             }  -- 等分窗口
G.map{'n', '<leader>sr', '<c-w><c-r>'         }  -- 交换窗口
G.map{'n', '<c-up>'    , '<cmd>res +5<enter>' }  -- 增加窗口高度
G.map{'n', '<c-down>'  , '<cmd>res -5<enter>' }  -- 减少窗口高度
G.map{'n', '<c-left>'  , '<c-w>10>'           }  -- 增加窗口宽度 
G.map{'n', '<c-right>' , '<c-w>10<'           }  -- 减少窗口宽度 


--------------------  MISC --------------------------
G.map{'n', '`', '~' }  -- change uppercase
G.map{'n', '<enter>', ':a<enter><enter>.<enter>'  }  -- add an empty line
G.map{'n', '<leader>sc', "<cmd>set spell!<enter>" } -- toggle spell check
G.map{'n', '<leader><tab>', "<cmd>%ret! 4<enter>" } -- replace tab with space
G.map{'n', '<leader>R', "<cmd>ReloadConfig<enter>"}  -- reload configurations
