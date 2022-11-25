" Plugin Management
"

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'


" lsp_lines looks interesting, maybe it can be used
" to show grammarly diagnostics ?
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'David-Kunz/markid'
Plug 'ThePrimeagen/jvim.nvim'

Plug 'tpope/vim-fugitive'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'numToStr/Comment.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'mbbill/undotree'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'nvim-zh/colorful-winsep.nvim'

" Markdown LSP
Plug 'artempyanykh/marksman'
" add filetype so we can associate .mdx with markdown
Plug 'nathom/filetype.nvim',


call plug#end()


"
" General Settings
"

" set number relativenumber
set number
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set wrap linebreak
set splitbelow splitright
set completeopt=menuone,noselect
set foldmarker=<<<,>>>
set foldmethod=marker
set title
set noshowmode
set virtualedit=block
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set expandtab

set laststatus=3
set winbar=%=%m\ %f

setglobal termguicolors

let mapleader = " "

"
" Autocommands
"

augroup cleanup_file
    autocmd!
    autocmd BufWritePre * let save_pos = getpos('.')
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre * call setpos('.', save_pos)
    autocmd BufWritePre * lua vim.lsp.buf.format()
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=40})
augroup END

autocmd BufEnter * setlocal fo-=c fo-=r fo-=o

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul


"
" Keybindings
"

nnoremap <silent> <C-s> :w<CR>

"" Navigating Splits
nnoremap <silent> <A-h> <C-w><C-h>
nnoremap <silent> <A-j> <C-w><C-j>
nnoremap <silent> <A-k> <C-w><C-k>
nnoremap <silent> <A-l> <C-w><C-l>

"" Resizing Splits
nnoremap <silent> <C-Up>    :resize +2<CR>
nnoremap <silent> <C-Down>  :resize -2<CR>
nnoremap <silent> <C-Left>  :vertical resize +2<CR>
nnoremap <silent> <C-Right> :vertical resize -2<CR>

"" Spell Checking
nnoremap <silent> <Leader>sc :set spell!<CR>

"" System Clipboard
nnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>p "+p

vnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>p "+p

"" Centering Stuff
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> G Gzzzv


inoremap <silent> ,         ,<C-g>u
inoremap <silent> .         .<C-g>u
inoremap <silent> <Space>   <Space><C-g>u

inoremap <silent> <A-k> <Up>
inoremap <silent> <A-j> <Down>
inoremap <silent> <A-h> <Left>
inoremap <silent> <A-l> <Right>


vnoremap <silent> < <gv
vnoremap <silent> > >gv

vnoremap <silent> <A-k> :move '<-2<CR>gv-gv
vnoremap <silent> <A-j> :move '>+1<CR>gv-gv


xnoremap <silent> p pgvy

"" Undo Tree
nnoremap <silent> <F5> :UndotreeToggle<CR>


"
" Colorscheme
"

"" Gruvbox
lua << EOF
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {},
})
EOF
colorscheme gruvbox


" jump to start of line
function! JumpToStartOfLine()

   let l:CurCol = col(".")

   if l:CurCol == 1
      normal _
   else
      normal 0
      " call cursor(".", 1)
   endif

endfunction

" jump to end line
function! JumpToEndOfLine()

   let l:CurCol = col(".")
   let l:EndCol = col("$")-1

   if l:CurCol == l:EndCol
      normal g_
   else
      normal $
      " exec 'call cursor(".", '.l:EndCol.')'
   endif

endfunction

nnoremap H :call JumpToStartOfLine()<CR>
nnoremap L :call JumpToEndOfLine()<CR>




"
" Lua Config
"
lua require('my_config')
