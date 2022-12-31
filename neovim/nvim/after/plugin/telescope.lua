local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set("n", "<c-p>", ":Telescope find_files<CR>", opts)
-- vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", opts)

-- does not work on Windows
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", opts)

