local set_keymap = vim.api.nvim_set_keymap
-- keymap(mode, keymap, map target, options)

local basic_opts = { noremap = true, silent = true }

set_keymap("n", "m", "%", basic_opts)
set_keymap("n", "%", "m", basic_opts)

set_keymap("n", "gj", "j", basic_opts)
set_keymap("n", "gk", "k", basic_opts)
set_keymap("n", "j", "gj", basic_opts)
set_keymap("n", "k", "gk", basic_opts)
set_keymap("v", "gj", "j", basic_opts)
set_keymap("v", "gk", "k", basic_opts)
set_keymap("v", "j", "gj", basic_opts)
set_keymap("v", "k", "gk", basic_opts)

set_keymap("n", "<S-h>", "^", basic_opts)
set_keymap("n", "<S-l>", "$", basic_opts)
set_keymap("v", "<S-h>", "^", basic_opts)
set_keymap("v", "<S-l>", "$", basic_opts)

set_keymap("n", "ZZ", "<nop>", basic_opts)
set_keymap("n", "ZQ", "<nop>", basic_opts)
set_keymap("n", "Q", "<nop>", basic_opts)