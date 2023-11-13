vim.g.dap_virtual_text = true

-- Automatic fold definition done by treesitter
-- https://www.jmaguire.tech/posts/treesitter_folding/
local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
