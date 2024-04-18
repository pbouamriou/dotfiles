require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


-- map('i', '<Tab>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr = true})
-- map('i', '<Esc>', 'pumvisible() ? "\\<C-e>" : "\\<Esc>"', {expr = true})
-- map('i', '<C-j>', 'pumvisible() ? "\\<C-p>" : "\\<Down>"', {expr = true})
-- map('i', '<C-k>', 'pumvisible() ? "\\<C-n>" : "\\<Up>"', {expr = true})

vim.api.nvim_set_keymap('c', '<Up>', 'wildmenumode() ? "<Left>" : "<Up>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<Down>', 'wildmenumode() ? "<Right>" : "<Down>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<Left>', 'wildmenumode() ? "<Up>" : "<Left>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<Right>', 'wildmenumode() ? "<Down>" : "<Right>"', {expr = true, noremap=true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
