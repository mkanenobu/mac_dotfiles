local options = {
	encoding = "utf-8",
  ambiwidth = "double",
  history = 1000,
  title = true,
  wrap = true,

  backup = false,
  swapfile = false,
  hidden = true,
  autoread = true,
  display = "lastline",
  inccommand = "split",

  hlsearch = true,
  incsearch = true,
  smartcase = true,
  ignorecase = true,
  wrapscan = true,

  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  smarttab = true,
  autoindent = true,
  showbreak = ">>> ",
  list = true,

  mouse = "",
  ruler = true,
  number = true,
  wildmode = {"longest", "list", "full"},
  wildmenu = true,
  showcmd = true,
  showmatch = true,
  matchtime = 1,
  foldlevel = 100,
  laststatus = 2,
  clipboard = {"unnamed", "unnamedplus"},
  splitbelow = true,

  termguicolors = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
