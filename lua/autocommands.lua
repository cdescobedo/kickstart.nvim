-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Go template filetype detection
vim.filetype.add {
  extension = {
    tmpl = 'gotmpl',
    gohtml = 'gotmpl',
    gotmpl = 'gotmpl',
    templ = 'templ',
  },
  pattern = {
    ['.*%.html%.tmpl'] = 'gotmpl',
    ['.*%.tmpl%.html'] = 'gotmpl',
  },
}

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Make SignColumn and LineNr transparent after colorscheme loads',
  callback = function()
    -- Set the background of the gutter to NONE (transparent)
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#1f2335' })

    -- Set LineNr background to NONE if needed
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
  end,
})
