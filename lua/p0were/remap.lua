vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Select and move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- Page Half Jumping
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")


-- search and cursor stays mid
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')


vim.keymap.set('x', '<leader>p', "\"_dP")



vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")


vim.keymap.set('n', "Q", "<nop>")

vim.keymap.set('i', "<PageDown>", "<Nop>")
vim.keymap.set('i', "<PageUp>", "<Nop>")

vim.cmd({ cmd = "map", args = { '<PageDown>', '<Nop>' } })
vim.cmd({ cmd = "map", args = { '<PageUp>', '<Nop>' } })
