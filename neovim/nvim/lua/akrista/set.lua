-- Cursor
-- vim.opt.guicursor = ""

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Enables 24-bit RGB color in the TUI.
vim.opt.termguicolors = true

-- List mode: By default, show tabs as ">", trailing spaces as "-", andnon-breakable space characters as "+"
vim.opt.list = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

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
vim.opt.incsearch = true
-- When on, lines longer than the width of the window will wrap and displaying continues on the next line
vim.opt.wrap = true
-- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text
vim.opt.breakindent = true
-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2
-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.expandtab = true
-- vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- When on, Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read
vim.opt.undofile = true
-- Show the line number relative to the line with the cursor in front of each line. Relative line numbers help you use the |count| you can precede some vertical motion commands (e.g. j k + -) with, without having to calculate it yourself
vim.wo.relativenumber = false

-- Old VIM Script Commands

vim.cmd([[
set spell
]])

-- Suppress errors in Windows 

vim.notify = function (msg, log_level, _opts)
    if msg:match("exit code") then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
    vim.api.nvim_echo({{msg}}, true, {})
    end
  end

-- Keymaps --

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Opens Vim File Explorer
keymap("n", "<leader>pv", vim.cmd.Ex, opts)

-- Yank to System
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

keymap("n", "<leader>d", "\"_d", opts)
keymap("v", "<leader>d", "\"_d", opts)

-- Close buffers
keymap("n", "<C-w>", "<cmd>bdelete!<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
-- keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
-- keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jj fast to enter
-- keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
-- keymap("n", "<c-b>", ":NvimTreeToggle<CR>", opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- keymap("n", "<c-k>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<c-k>", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Custom
-- keymap("n", "<leader>p", "<cmd> PasteImg <CR>", opts)
-- keymap("n", "<leader>e", "$", opts)
-- keymap("n", "S", "<cmd> %s//g", opts)
-- keymap("n", "<F5>", "<cmd> UndotreeToggle <CR> <cmd> UndotreeFocus <CR>", opts)
-- keymap("n", "<C-\\>", "<cmd> TZAtaraxis <CR>", opts)
-- keymap("n", "<Leader>1", "1gt<CR>", opts)
-- keymap("n", "<Leader>2", "2gt<CR>", opts)
-- keymap("n", "<Leader>3", "3gt<CR>", opts)
-- keymap("n", "<Leader>4", "4gt<CR>", opts)
-- keymap("n", "<Leader>5", "5gt<CR>", opts)
-- Ctrl + T, opens new empty tab with minimap open as well
-- keymap("n", "<c-t>", "<cmd> tabnew<CR><cmd> Minimap<CR>", opts)
-- keymap("n", "<c-w>", "<cmd> tabclose<CR>", opts)
