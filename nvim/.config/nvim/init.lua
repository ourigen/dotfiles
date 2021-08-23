-- SETTINGS {{{ --
vim.opt.mouse = 'nv'                            -- enable mouse support for modes: normal, visual
vim.opt.title = true
vim.opt.titlestring = '%f - Neovim'             -- title of the terminal window
vim.opt.laststatus = 2                          -- always show statusline on last window
vim.opt.termguicolors = true                    -- use gui :highlight attributes instead of cterm attributes
vim.opt.joinspaces = false                      -- insert only one spaces after a '.', '?' and '!' with a join command
vim.opt.formatoptions:append { 'n' }            -- when formatting text, recognize numbered lists
-- vim.opt.timeoutlen=250                       -- time in milliseconds to wait for a mapped sequence to complete.
vim.opt.scrolloff = 3                           -- minimal screen lines to keep above and below cursor
vim.opt.number = true                           -- print line number in front of each line
vim.opt.relativenumber = true                   -- show line number relative to cursor line in front of each line
vim.opt.splitbelow = true                       -- :split will put new window below current
vim.opt.splitright = true                       -- :vsplit will put new window right of current one
vim.opt.textwidth=120                           -- maximum width of text that is being inserted
vim.opt.synmaxcol=1000                          -- maximum column in which to search for syntax items
vim.opt.linebreak = true                        -- wrap long lines at a character in 'breakat'
vim.opt.breakindent = true                      -- every wrapped line will continue visually indented
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase  = true                       -- override 'ignorecase' if search pattern contains upper case characters
vim.opt.foldmethod = 'marker'                   -- folds are defined by {{{ }}} markers
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.conceallevel = 2                        -- concealed text is hidden unless a custom replacement character is defined
vim.opt.tabstop = 4                             -- spaces a <Tab> counts for
vim.opt.shiftwidth = 0                          -- use 'tabstop' amount for each step of (auto)indent ('cindent', >>, <<)
vim.opt.completeopt = {
	'menuone',                                  -- use popup menu even when there is only one match
	'noselect',                                 -- do not select a match in menu
	'noinsert'                                  -- do not insert any text until user selects
}

vim.opt.complete:remove {
	'u',                                        -- don't scan unloaded buffers in buffers list
	'b'                                         -- don't scan loaded buffers in buffers list
}

vim.opt.diffopt:append {
	'vertical',                                 -- start diff mode with vertical splits
	'foldcolumn:0'                              -- don't show fold column in diff view
}

vim.opt.showmode = false                        -- hides -- INSERT/REPLACE/VISUAL -- message on last line
vim.opt.gdefault = true                         -- all matches in a line are substituted
vim.opt.fillchars = {
	diff = '·',                                 -- character for deleted lines of 'diff' option
	eob = ' '                                   -- character for empty lines at end of a buffer
}

vim.opt.list = true                             -- show tabs, end of line, trailing spaces, etc.
vim.opt.listchars = {
	tab      = '│ ',                            -- two or three characters to be used to show a tab.
	eol      = '¬',                             -- character to show at end of each line
	extends  = '›',                             -- character to show in last column, when 'wrap' is off
	precedes = '‹',                             -- character to show in first column, when 'wrap' is off
	trail    = '·'                              -- character to show for trailing spaces
}
vim.opt.pumheight = 25                          -- maximum number of items to show in completion popup
vim.opt.cursorline = true                       -- highlight line of cursor
vim.opt.lazyredraw = true                       -- don't redraw screen macros, registers and commands that haven't been typed
vim.opt.hidden = true                           -- buffer becomes hidden when it's abandoned
vim.opt.clipboard = 'unnamedplus'               -- prepend clipboard register '+' for all yank, delete, change and put operations
vim.opt.omnifunc = 'syntaxcomplete#Complete'    -- used for omni completion i_CTRL-X_CTRL-O
vim.opt.virtualedit = 'block'                   -- cursor can be positioned where there's no actual character in Visual block mode
vim.opt.wildignorecase = true                   -- case ignored when completing files/directories

-- searched using gf, [f, ]f, ^Wf, :find, :sfind, :tabfind commands
vim.opt.path:remove {
	'/usr/include'
}

vim.opt.path:append {
	'~/documents/**5',   -- **[n] matches up to [n] directories deep
	'~/projects/**',
	'~/sync/**3',
	'~/.config/**5',
	'~/.local/bin/**3'
}

vim.opt.wildmode = {
	'longest:full',                            -- complete till longest common string but also start wildmenu
	'full'                                     -- complete the next full match
}
-- ignored when expanding wildcards, completing file/directory names
vim.opt.wildignore = {
	'*.git', '*.hg', '*.svn',
	'*.aux', '*.out', '*.toc', '*.log', '*.fdb_latexmk', '*.fls', '*.synctex.gz',
	'*.zip', '*.tar.gz', '*.tar.bz2', '*.rar', '*.tar.xz',
	'*.mp3', '*.oga', '*.ogg', '*.wav', '*.flac', '*.mpeg',
	'*.eot', '*.otf', '*.ttf', '*.woff',
	-- '*.jpg', '*.bmp', '*.gif', '*.png', '*.jpeg',
	-- '*.docx', '*.pptx', '*.xlsx', '*.pdf',
}
vim.opt.shortmess:append {
	m = true,                  -- use [+] instead of [Modified]
	r = true,                  -- use [RO] instead of [readonly]
	I = true,                  -- don't give intro message when starting Vim
	A = true,                  -- don't give ATTENTION message when an existing swap file
	c = true,                  -- don't give ins-completion-menu messages
}

if vim.env.USER == 'root' then
	vim.opt.shada = ''
	vim.opt.shadafile = 'NONE'
	vim.opt.undofile = false
else
vim.opt.shada = "'0,<0,s10,f0,h"      -- store maximum of marks for 0 file, 0 lines per register, 10KiB size, 0 files
-- shada defaults: Neovim: !,'100,<50,s10,h
-- - ! save/restore global variables (only all-uppercase variables)
-- - '[n] save/restore marks from last [n] files
-- - <[n] save/restore [n] lines from each register
-- - s[n] max item size [n]KB
	-- - h do not save/restore 'hlsearch' setting
	-- - f[n] store [n] file marks
	vim.opt.undofile = true             -- automatically saves persistent undo history
	vim.opt.undolevels=500              -- maximum number of changes that can be undone
end

vim.opt.swapfile = false                          -- don't create swapfile for uffer

if vim.fn.executable('rg') then
	vim.opt.grepprg='rg --no-heading --smart-case --vimgrep '
	vim.opt.grepformat:prepend { '%f:%l:%c:%m' }
end

-- }}} --

-- MAPPINGS {{{ --

vim.g.mapleader = ' '   -- Set <leader> to <Space>
vim.api.nvim_set_keymap('n', ']b', '<cmd>bnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[b', '<cmd>bprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']l', '<cmd>lnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[l', '<cmd>lprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']q', '<cmd>cnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[q', '<cmd>cprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']Q', '<cmd>cnfile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[Q', '<cmd>cpfile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']l', '<cmd>lnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[l', '<cmd>lprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']L', '<cmd>lnfile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[L', '<cmd>lpfile<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files hidden=true<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope git_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope help_tags<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope lsp_workspace_symbols<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>IronRepl<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', {noremap = true})

-- used in lspconfig
-- vim.api.nvim_set_keymap('n', '<Space>e', '<cmd>e $MYVIMRC<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap = true})

vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('x', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('x', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('x', '*', '<C-c>/<C-r>=utils#Visualstar()<CR><CR>', {noremap = true})
vim.api.nvim_set_keymap('x', '#', '<C-c>?<C-r>=utils#Visualstar()<CR><CR>', {noremap = true})

vim.api.nvim_set_keymap('n', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true })
vim.api.nvim_set_keymap('x', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true })
vim.api.nvim_set_keymap('o', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true })
vim.api.nvim_set_keymap('n', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true })
vim.api.nvim_set_keymap('x', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true })
vim.api.nvim_set_keymap('o', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true })

-- mapped by default
-- vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})
vim.api.nvim_set_keymap('n', 'vv', '^vg_', {noremap = true})
vim.api.nvim_set_keymap('n', 'zp', 'zMzvzz', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'vaz', 'v[zo]z$', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'viz', 'v[zj0o]z$k', {noremap = true})

-- }}} --

-- Disable extra plugins/checks
vim.g.python_host_skip_check = 1
if vim.fn.executable('python') then
	vim.g.python_host_prog  = vim.fn.exepath('python')
	vim.g.python3_host_prog = vim.fn.exepath('python3')
else
	vim.g.loaded_python_provider = 0
	vim.g.loaded_python3_provider = 0
end

vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_gzip          = 1
vim.g.loaded_tarPlugin     = 1
vim.g.loaded_tar           = 1
vim.g.loaded_zipPlugin     = 1
vim.g.loaded_zip           = 1

vim.api.nvim_exec(
	[[
	augroup TerminalInsert
		autocmd!
		autocmd BufWinEnter,WinEnter term://* startinsert
		autocmd BufLeave term://* stopinsert
		autocmd TermOpen * setlocal nonumber
		autocmd TermOpen * setlocal norelativenumber
	augroup end
	]],
	false
)

vim.api.nvim_exec(
	[[
	augroup QuickfixOpen
		autocmd!
		autocmd QuickFixCmdPost grep cwindow 10
		autocmd QuickFixCmdPost lgrep lwindow 10
		autocmd QuickFixCmdPost [^l]* cwindow 10
	augroup END
	]],
	false
)

vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
