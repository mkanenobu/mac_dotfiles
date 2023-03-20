" config file for Neovim
filetype indent plugin off

let configDir='~/.config/nvim'

let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = system('echo -n $(which python3)')

set encoding=utf-8
set ambiwidth=double
set history=1000

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set showbreak=>>>\ 
autocmd filetype quickrun setlocal showbreak=""
set list
" set nofixeol
" set listchars=tab:\¦\
set listchars=tab:>-,trail:-,extends:>

set helplang=ja,en

" set filetype by extension
augroup Set_filetype
  autocmd!
  autocmd BufNewFile,BufReadPost,FileReadPost *.vader set filetype=vim
  autocmd BufNewFile,BufReadPost,FileReadPost *.fsx set filetype=fsharp
  autocmd BufNewFile,BufReadPost,FileReadPost *.rkt set filetype=racket
  autocmd BufNewFile,BufReadPost,FileReadPost *.jl set filetype=julia
  autocmd BufNewFile,BufReadPost,FileReadPost *.nims set filetype=nim
  autocmd BufNewFile,BufReadPost,FileReadPost *.k set filetype=k
  autocmd BufNewFile,BufReadPost,FileReadPost *.factor set filetype=factor
  autocmd BufNewFile,BufReadPost,FileReadPost *.swift set filetype=swift
augroup ENDndif

" indent widh
augroup Indent
  autocmd filetype nim setlocal softtabstop=2 shiftwidth=2
  autocmd filetype yaml setlocal softtabstop=2 shiftwidth=2
  autocmd filetype php setlocal tabstop=2 shiftwidth=2
  autocmd filetype html setlocal tabstop=2 shiftwidth=2
  autocmd filetype pascal setlocal softtabstop=2 shiftwidth=2
  autocmd filetype markdown setlocal softtabstop=2 shiftwidth=2
  autocmd filetype vim setlocal softtabstop=2 shiftwidth=2
  autocmd filetype javascript setlocal softtabstop=2 shiftwidth=2
  autocmd filetype json setlocal softtabstop=2 shiftwidth=2 conceallevel=0
  autocmd filetype typescript setlocal softtabstop=2 shiftwidth=2
  autocmd filetype sh setlocal softtabstop=2 shiftwidth=2
  autocmd filetype bash setlocal softtabstop=1 shiftwidth=2
  autocmd filetype c setlocal softtabstop=3 shiftwidth=3 noexpandtab
  autocmd filetype rust setlocal softtabstop=4 shiftwidth=4
  autocmd filetype groovy setlocal softtabstop=4 shiftwidth=4
  autocmd filetype xml setlocal softtabstop=2 shiftwidth=2 noexpandtab
augroup END

" shebang auto insert
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.php 0put =\"<?php\" | 2
  autocmd BufNewFile *.lua 0put =\"#!/usr/bin/env lua5.3\" | 2
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\" | 2
  autocmd BufNewFile *.sh 0put =\"#!/bin/sh\" | 2
  autocmd BufNewFile *.bash 0put =\"#!/usr/bin/env bash\" | 2
  autocmd BufNewFile *.pas 0put =\"program \" .  expand(\"%:r\") . \";\" | 2
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
  autocmd BufNewFile *.uml 0put =\"@startuml\<nl>\<nl>\<nl>@enduml\"| 2
  autocmd BufNewFile *.dc 0put =\"#!/usr/bin/env dc\" | 2
augroup END

set nobackup
set noswapfile
set hidden
set autoread

set wrap
set display=lastline

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

set inccommand=split

set wrapscan
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

set mouse=""
set ruler
set number
set wildmode=longest,list,full
set wildmenu
" set wildoptions+=pum
" set pumblend=20
" set cursorline
set showcmd
set title
set showmatch
set matchtime=1

" runtime macros/matchit.vim
" vim-matchup
" let g:loaded_matchit = 1

set foldlevel=100

set laststatus=2
set clipboard=unnamed,unnamedplus
" set clipboard+=unnamedplus
autocmd InsertLeave * set nopaste

" Keymap
let mapleader = "\<Space>"
nnoremap <kplus> <C-a>
nnoremap <kMinus> <C-x>
nnoremap + <C-a>
nnoremap - <C-x>

nnoremap m %
nnoremap % m

" C-CR in middle of line
inoremap <C-j> <Esc>o
inoremap <C-CR> <Esc>o

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

nmap <Space>y :%y<CR>

tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-[> <C-\><C-n>

nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
vnoremap gj j
vnoremap gk k
vnoremap j gj
vnoremap k gk

inoremap <C-c> <Esc>

nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $

" search selected
vnoremap * "zy:let @/ = @z<CR>n
" Window manage
nnoremap <S-M-j> :split<CR>
nnoremap <S-M-l> :vsplit<CR>

"
vnoremap { (
vnoremap } )

nnoremap <C-j> }
nnoremap <C-k> {

command! Z :qa!

" close on q
autocmd FileType qf,help nmap <buffer> <silent> q :q<CR>

if has('mac')
  nnoremap <silent> <Space>l :silent !chrome-tab-reload-mac<CR><CR>
else
  nnoremap <silent> <Space>l :silent !chrome-tab-reload<CR><CR>
endif

nnoremap <C-g> :Rg 
" grep current word
nnoremap <C-]> :Rg <C-r><C-w><CR>

" vim-plug
" https://github.com/junegunn/vim-plug
" type `:PlugInstall` first
call plug#begin()
Plug 'tomasr/molokai'
Plug 'mhinz/vim-signify'
Plug 'thinca/vim-quickrun'
call plug#end()

augroup molokai_custom
  autocmd!
  autocmd ColorScheme molokai highlight Visual ctermbg=242
  autocmd ColorScheme molokai highlight Comment ctermfg=102
  autocmd ColorScheme molokai highlight Search ctermbg=242 ctermfg=15
  autocmd ColorScheme molokai highlight MatchParen ctermbg=242 ctermfg=15
augroup END
colorscheme molokai
if !has('gui_running')
  augroup transparent
    autocmd!
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
  augroup END
endif

" quickrun
map <Space>r :QuickRun -input =@+<CR>
" バッファを下に出す
" フォーカスをバッファ側に
  "\ 'runner' : 'vimproc',
let g:quickrun_config = {
  \ '_': {
    \ 'split': '',
    \ 'outputter/buffer/into': '1',
  \},
\}

let g:quickrun_config.nim = {
  \ 'cmdopt': 'c --run --verbosity:0 --warning[SmallLshouldNotBeUsed]:off -d:ssl --hints:off',
\}

let g:quickrun_config.freepascal = {
  \ 'command': 'fpr',
\}

let g:quickrun_config.forth = {
  \ 'exec': 'gforth %s -e bye'
\}

let g:quickrun_config.javascript = {
  \ 'exec': 'node %s'
\}

let g:quickrun_config.haskell = {
  \ 'command': 'stack',
  \ 'exec': '%c %o %s %a',
  \ 'cmdopt': 'runghc'
\}

let g:quickrun_config.rust = {
  \ 'command': 'rustc',
  \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
  \ 'cmdopt': '-A dead_code',
\}

let g:quickrun_config.ocaml = {
  \ 'command': 'obrun',
  \ 'exec': ['%c %o %s'],
  \ 'cmdopt': '-quiet',
  \ 'tempfile': '%{tempname()}.ml',
\}

let g:quickrun_config.typescript = {
  \ 'exec': 'npx ts-node %s',
\}

set splitbelow

autocmd FileType markdown map <Space>r :!open -a typora "%:p" <CR><CR>
autocmd FileType html map <Space>r :!open -a "Google Chrome" "%:p" <CR><CR>
autocmd FileType plantuml map <Space>r :!open -a "Google Chrome" "%:p" <CR><CR>
" autocmd FileType scheme map <Space>r :normal ggcpG<cr>`s

" vim-signify
let g:signify_disable_by_default = 0
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 0
nmap <S-j> <plug>(signify-next-hunk)
nmap <S-k> <plug>(signify-prev-hunk)

" Toglle gutter display for terminal copy
let g:copy_format = 0
function! CopyFormatToggle()
  if g:copy_format == 0
    IndentLinesToggle
    set nonumber
    let g:copy_format = 1
  else
    IndentLinesToggle
    set number
    let g:copy_format = 0
  endif
endfunction
command! CopyToggle call CopyFormatToggle()

" word count
function! Wc()
  :exec "!wc -m %"
endfunction
command! Wc call Wc()

syntax enable
filetype indent plugin on
set secure
