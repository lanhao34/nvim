let g:python_host_prog = 'user/bin/python'
nnoremap <SPACE> <Nop>
let mapleader = "\<space>"

set hidden
set number
set nocp
filetype off
set nocompatible

call plug#begin()
" Plug 'junegunn/fzf.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'frazrepo/vim-rainbow'
" Plug 'junegunn/vim-peekaboo'
" Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim' " required by telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'debugloop/telescope-undo.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
"Plug 'hkupty/nvimux'
" Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'bigeagle/molokai'
Plug 'EdenEast/nightfox.nvim'
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'romgrk/barbar.nvim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
"if has('nvim')
 ""Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"else
 ""Plug 'Shougo/denite.nvim'
 ""Plug 'roxma/nvim-yarp'
 ""Plug 'roxma/vim-hug-neovim-rpc'
"endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'windwp/nvim-autopairs'
call plug#end()

colorscheme nightfox
" UI
" if !exists("g:vimrc_loaded")
"     colorscheme molokai
"     let g:molokai_original = 1
"     if has("gui_running")
"         set guioptions-=T "隐藏工具栏
"         set guioptions-=L
"         set guioptions-=r
"         set guioptions-=m
"         set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
"         set gfw=STHeiti\ 9
"         set langmenu=en_US
"         set linespace=0
"     endif " has
" endif " exists(...)

" nnoremap <esc><esc> :noh<return><esc>

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap kj <esc>

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

set nohlsearch
set incsearch
set clipboard=unnamed

" vim-rainbow
"let g:rainbow_active = 1

set undodir=~/.vim/undo
set undofile
set nrformats+=alpha
syntax on
filetype on
filetype plugin on
filetype indent on

set list lcs=tab:\¦\   

if has("autocmd")  " go back to where you exited
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

if has('mouse')
    set mouse=a
    set selectmode=mouse,key
    set nomousehide
endif

set autoindent
set modeline
"set cursorline
"set cursorcolumn

set shiftwidth=4
set tabstop=4
set softtabstop=4

set showmatch
set matchtime=0
set nobackup
set nowritebackup
set directory=~/.nvim/.swapfiles//

if has('nvim')
" set termguicolors
  set ttimeout
  set ttimeoutlen=0
endif

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

"conceal
set conceallevel=2
set concealcursor=""

set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

"按缩进或手动折叠
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldcolumn=0 "设置折叠区域的宽度
set foldlevelstart=200
set foldlevel=200  " disable auto folding
" 用空格键来开关折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" vnoremap <Space> zf


set smartcase
set ignorecase
set nohlsearch
set incsearch
set autochdir

vmap j gj
vmap k gk
nmap j gj
nmap k gk
tnoremap <Esc> <C-\><C-n>
nmap T :tabnew<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()
au FileType vue syntax sync minlines=500

function ScriptHeader()
    if &filetype == 'python'
        let header = "#!/usr/bin/env python"
        let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
    elseif &filetype == 'sh'
        let header = "#!/bin/bash"
    endif
    let line = getline(1)
    if line == header
        return
    endif
    normal m'
    call append(0,header)
    if &filetype == 'python'
        call append(2, cfg)
    endif
    normal ''
endfunction

" runtime config/nerdtree.vim
runtime config/nerdcommenter.vim
"runtime config/denite.vim
"runtime init.lua.vim
runtime config/telescope.vim
runtime config/barbar.vim
runtime config/coc.vim
runtim config/toggleterm.vim
lua require("nvim-autopairs").setup {}
runtime config/toggleterm.lua

