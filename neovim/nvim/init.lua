-- lua/plugins.lua
require('plugins')
-- Loads Neovim Faster
--require('impatient')
-- lua/keymaps.lua
require('keymaps')

-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --

-- Leader Key is "Space"
vim.g.mapleader = " "
-- Clipboard compatibility, i have to test this...
vim.o.clipboard = "unnamedplus"
-- Print the line number in front of each line
vim.opt.number = true
-- Enable the use of the mouse = all previous modes
vim.opt.mouse = 'a'
-- Ignore case in search patterns
vim.opt.ignorecase = true
-- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.smartcase = true
-- When there is a previous search pattern, highlight all its matches
vim.opt.hlsearch = false
-- When on, lines longer than the width of the window will wrap and displaying continues on the next line
vim.opt.wrap = true
-- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text
vim.opt.breakindent = true
-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2
-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.expandtab = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
-- When on, Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read
vim.opt.undofile = true
-- Show the line number relative to the line with the cursor in front of each line. Relative line numbers help you use the |count| you can precede some vertical motion commands (e.g. j k + -) with, without having to calculate it yourself
vim.wo.relativenumber = false

--
-- Old VIM Script Commands
--
vim.cmd([[
set spell
]])

--
-- Suppress errors in Windows
-- 

vim.notify = function (msg, log_level, _opts)
    if msg:match("exit code") then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
    vim.api.nvim_echo({{msg}}, true, {})
    end
  end

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

-- Enables 24-bit RGB color in the TUI.
vim.opt.termguicolors = true
--- Colorscheme
vim.cmd [[
try
  syntax enable
  colorscheme monokai_pro
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- List mode: By default, show tabs as ">", trailing spaces as "-", andnon-breakable space characters as "+"
vim.opt.list = true

-- Opens minimap on startup
vim.cmd[[
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
]]

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

-- File Explorer nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

--Pretty Status bar
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox_dark',
	},
}

-- Check if you are using windows or no so toggleterm defaults to powershell
vim.cmd[[
let &shell = has('win32') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
]]

-- Add Ctrl + X and initialize toggle term
require("toggleterm").setup {
	open_mapping = [[<c-x>]],
	shade_terminals = false
}

-- Add projects capability to telescope
require('telescope').load_extension('projects')


