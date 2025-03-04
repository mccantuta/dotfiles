-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Options through Telescope
vim.api.nvim_set_keymap("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {noremap=false})

vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",{silent = true, noremap = true})

-- Git
--vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit -m \"", {noremap=false})
--vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push -u origin HEAD<CR>", {noremap=false})

-- Zoom buffer
vim.api.nvim_set_keymap("n", "<leader>zz", ":tabnew %<CR>", {noremap=true})
