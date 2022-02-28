local keymap = vim.api.nvim_set_keymap
keymap('n','<Leader>w',':w<CR>',{})
keymap('n','<Leader>q',':q<CR>',{})
keymap('n','<Leader>zz',':wq<CR>',{})
local opts = { noremap = true }
keymap('n','<c-j>','<c-w>j',opts)
keymap('n','<c-h>','<c-w>h',opts)
keymap('n','<c-k>','<c-w>k',opts)
keymap('n','<c-l>','<c-w>l',opts)

keymap('n','<Leader>ff','<cmd>Telescope find_files<CR>',opts)
keymap('n','<leader>fg','<cmd>Telescope live_grep<cr>',opts)
keymap('n','<leader>fb','<cmd>Telescope buffers<cr>',opts)
keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',opts)
