-- vim-plug
-- https://github.com/junegunn/vim-plug
-- Install vim-plug and run `:PlugInstall` first
local plug = vim.fn["plug#"]

vim.call("plug#begin")
plug "tomasr/molokai"
plug "mhinz/vim-signify"
vim.call("plug#end")

vim.cmd("colorscheme molokai")

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

local theme_custom_group = "theme_custom"
vim.api.nvim_create_augroup(theme_custom_group, {})

local theme_customs = {
  "Comment ctermfg=102",
  "Search ctermbg=242 ctermfg=15",
  "MatchParen ctermbg=242 ctermfg=15",
  "Visual ctermbg=242",
}
for _, custom in ipairs(theme_customs) do
  vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
    group = theme_custom_group,
    command = "highlight " .. custom
  })
end
