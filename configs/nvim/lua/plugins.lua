-- vim-plug
-- https://github.com/junegunn/vim-plug
-- run `:PlugInstall` first
local plug = vim.fn["plug#"]

vim.call("plug#begin")
plug "tomasr/molokai"
plug "mhinz/vim-signify"
vim.call("plug#end")

vim.cmd("colorscheme molokai")

local molokai_custom_augroup = "molokai_custom"
vim.api.nvim_create_augroup(molokai_custom_augroup, {})

local molokai_custom_autocmds = {
  "Visual ctermbg=242",
  "Comment ctermfg=102",
  "Search ctermbg=242 ctermfg=15",
  "MatchParen ctermbg=242 ctermfg=15",
}

for _, custom in ipairs(molokai_custom_autocmds) do
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = molokai_custom_augroup,
    pattern = "molokai",
    command = "highlight " .. custom
  })
end

local transparent_augroup = "transparent"
vim.api.nvim_create_augroup(transparent_augroup, {})
local transparent_highlight_target = {
  "Normal",
  "LineNr",
  "SignColumn",
  "VertSplit",
  "NonText",
}

for _, custom in ipairs(transparent_highlight_target) do
  vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
    group = transparent_augroup,
    command = "highlight " .. custom .. " ctermbg=none guibg=none"
  })
end