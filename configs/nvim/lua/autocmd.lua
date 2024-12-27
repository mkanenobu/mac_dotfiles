local shebang_augroup = "shebang"
vim.api.nvim_create_augroup(shebang_augroup, {})

local shebang_by_extension = {
  py = {"#!/usr/bin/env python", "# -*- coding: utf-8 -*-"},
  php = "<?php",
  rb = "#!/usr/bin/env ruby",
  sh = "#!/bin/sh",
  bash = "#!/usr/bin/env bash",
  cl = "#!/usr/bin/env sbcl --script",
}

local function insert_shebang()
  local ext = vim.fn.expand("%:e")
  local shebang = shebang_by_extension[ext]

  if shebang ~= nil then
    local shebang_flatten = vim.tbl_flatten({shebang})
    local shebang_linelen = vim.tbl_count(shebang_flatten)

    vim.api.nvim_put(shebang_flatten, "", false, true)

    vim.fn.append(shebang_linelen, "")
    vim.fn.cursor(shebang_linelen + 1, 0)
  end
end

vim.api.nvim_create_autocmd({"BufNewFile"}, {
  group = shebang_augroup,
  callback = function(event)
    insert_shebang()
  end
})
