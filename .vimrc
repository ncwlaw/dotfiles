set nocompatible

" Install plug if it's not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Bring in a bunch of packages.
call plug#begin()
" UI / Theme
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'

" Tools
Plug 'chrisbra/Colorizer'
" TODO: This still doesn't work the way I expect it to.
Plug 'ctrlpvim/ctrlp.vim'
" TODO: This still does things *wrong* with jumpping to closing pairs.
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'
" `gcc`, `gc` and others for commenting.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'

" Languages
Plug 'cespare/vim-toml'
Plug 'gabrielelana/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'timonv/vim-cargo'
Plug 'vim-latex/vim-latex'
call plug#end()

" Colorize color strings.
let g:colorizer_auto_color = 1

" Highlight search matches.
set hlsearch
" Map Ctrl-/ to clear highlighting.
" NOTE: It's very strange that <C-_> is vim's way of saying this.
nnoremap <silent> <C-_> :nohl<CR>

" Persist undos.
:silent call system('mkdir -p $HOME/.vim/undo')
set undodir=$HOME/.vim/undo
set undofile

" Use 24-bit colors (required for the 'one' theme to work).
set termguicolors

" Setup the color theme.
syntax enable
set background=dark
colorscheme one

" Configure lightline to always show.
" TODO: Git information in lightline.
set noshowmode
set laststatus=2
let g:lightline = { 'colorscheme': 'one' }

" Add a numberline gutter.
:set number

" Highlight the line the cursor is on.
:set cursorline

" Editor width configuration.
" TODO: Reconsider sidescroll.
set colorcolumn=80
set textwidth=0
set wrap

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v', 'c']
  for key in ['<up>', '<down>', '<left>', '<right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Bind vim style movement keys for command mode.
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>

" Bind standard movement C-a for moving to the start of the line.
" C-e is already bound.
cnoremap <C-a> <C-b>

" Bind F1 to look up under the cursor.
" TODO: This fails if nothing is under the cursor.
nnoremap <F1> :help <C-r><C-w><CR>

" Clipboard support
set clipboard=unnamed

" Strip whitespace on save.
autocmd BufEnter * EnableStripWhitespaceOnSave

" Folding
set nofoldenable

" Default indentation values.
set expandtab
set shiftwidth=4
set tabstop=4

" Some filetypes we default to smaller tab length.
filetype plugin indent on
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType eruby setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2

" Allow clicking with the mouse.
set mouse=a

" Allow subshells to detect running in vim.
let $INSIDE='vim'

" Vim command tab completion.
set wildmode=longest,list,full
set wildmenu

" Spell checking.
:map <F5> :setlocal spell! spelllang=en_us<CR>

" Markdown
let g:vim_markdown_conceal = 0
let g:tex_conceal = 0
let g:vim_markdown_math = 1

