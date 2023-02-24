local G = require('G')

---- set space as leader key
vim.o.mapleader = " "

G.map{'n', 'J', '5j'}
G.map{'n', 'K', '5k'}
G.map{'n', 'H', '^' }
G.map{'n', 'L', 'g_'}

G.map{'i', '<c-h>', '<left>' }
G.map{'i', '<c-j>', '<down>' }
G.map{'i', '<c-k>', '<up>'   }
G.map{'i', '<c-l>', '<right>'}

G.map{'n', '<enter>', ':a<enter><enter>.<enter>'}  -- add an empty line

G.map{'n', '`', '~' }

-------------------- save & quit --------------------
G.map{'n', '<c-q>', ':q<enter>' }
G.map{'n', '<c-s>', ':w<enter>' }
G.map{'i', '<c-s>', ':w<enter>' }
G.map{'x', '<c-s>', ':w<enter>' }
G.map{'v', '<c-s>', ':w<enter>' }

-------------------- copy & paste -------------------
G.map{'v', 'Y', '"+y'  }
G.map{'n', 'Y', '"+yy' }
G.map{'n', 'P', '"+p'  }
G.map{'v', 'p', 'pgvy' }  -- Don't lose clipboard when pasting


