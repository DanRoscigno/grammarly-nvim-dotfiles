" Plugin Management
"

call plug#begin()
" Simple configuration of LSPs
Plug 'neovim/nvim-lspconfig'

" no idea :(
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'

" no idea :(
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'


" lsp_lines looks interesting, maybe it can be used
" to show grammarly diagnostics ?
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

" This gives the file list when adding a link
" in a markdown file.  I think marksman LSP passes
" the files to cmp and cmp displays the list
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

" highlighting and indenting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'


" no idea :(
Plug 'David-Kunz/markid'
Plug 'ThePrimeagen/jvim.nvim'

" GitHub integration so that commands like `Git add` etc
" can be run from within vim.
Plug 'tpope/vim-fugitive'

" no idea :(
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Color scheme for nvim
Plug 'ellisonleao/gruvbox.nvim'
Plug 'norcalli/nvim-colorizer.lua'

" no idea :(
Plug 'numToStr/Comment.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'romgrk/barbar.nvim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" no idea :(
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

" set number so that every buffer shows line numbers
set number

" far left column to show modified lines and LSP diagnostics
set signcolumn=yes

" tabs are converted to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Always show the statusline
set laststatus=3

" no idea :(
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
set winbar=%=%m\ %f

" no idea :(
setglobal termguicolors

" in mapped key commands <leader> is the space key
let mapleader = " "

"
" Autocommands
"

" no idea :(
augroup cleanup_file
    autocmd!
    autocmd BufWritePre * let save_pos = getpos('.')
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre * call setpos('.', save_pos)
    autocmd BufWritePre * lua vim.lsp.buf.format()
augroup END

" no idea :(
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=40})
augroup END

" no idea :(
autocmd BufEnter * setlocal fo-=c fo-=r fo-=o

" no idea :(
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul


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

"
" Lua Config
"
lua require('my_config')
