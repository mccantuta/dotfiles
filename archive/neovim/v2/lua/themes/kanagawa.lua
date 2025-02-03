require('kanagawa').setup({
colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    theme = "wave",
})
vim.cmd("colorscheme kanagawa")
