" --- --- --- CORE --- --- ---
if !has('nvim')
    set nocompatible
endif

filetype off

set encoding=utf-8

nnoremap <SPACE> <Nop>
let mapleader = ' '



" --- --- --- VUNDLE PACKAGE MANAGEMENT --- --- ---

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ~ Essential plugins
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/syntastic'
" Plugin 'Shougo/deoplete.nvim'

" ~ Language plugins
Plugin 'jceb/vim-orgmode'                  " ORG mode for vim

" ~ Themes & Stuff
Plugin 'vim-airline/vim-airline'           " Nice statusline
Plugin 'vim-airline/vim-airline-themes'    " Themes for airline
Plugin 'dylanaraps/wal.vim'                " Theme for pywal integration

" ~ Currently unused plugins
"Plugin 'dag/vim2hs'                        " Haskell Mode
"Plugin 'eagletmt/neco-ghc'                 " Deoplete GHC
"Plugin 'eagletmt/ghcmod.vim'
"Plugin 'lukerandall/haskellmode-vim'
"Plugin 'ctrlpvim/ctrlp.vim'                " Open stuff
"Plugin 'jeetsukumaran/vim-buffergator'     " Buffer changer
"Plugin 'chriskempson/base16-vim'           " Base 16 themes
"Plugin 'jnurmine/Zenburn'                  " Zenburn theme

" Formats GitHub repo, git url, file path, vim-scripts.org
" :PluginList
" :PluginInstall
" :PluginUpdate
" :PluginSearch
" :PluginsClean

call vundle#end()
filetype plugin indent on



" --- --- --- PLUGIN CONFIGURATION --- --- ---

" --- NERDTREE (<leader>n) ---
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" --- AIRLINE ---
let g:airline_theme = 'wal'
set laststatus=2
set noshowmode
let g:ariline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" --- FZF (<leader><space>) ---
set rtp+=/usr/local/opt/fzf
nnoremap <leader><space>f :Files<CR>
nnoremap <leader><space>b :Buffers<CR>
nnoremap <leader><space>g :GFiles<CR>
nnoremap <leader><space>l :Lines<CR>
nnoremap <leader><space>w :Windows<CR>
nnoremap <leader><space>c :Commits<CR>
nnoremap <leader><space>h :History<CR>
nnoremap <leader><space>m :Marks<CR>
nnoremap <leader><space>a :Ag<CR>
" CTRL-T  | CTRL-X    | CTRL-V
" new tab | new split | new vsplit

" --- HASKELL ---
" au Bufenter *.hs compiler ghc
" :let g:haddock_browser="/usr/bin/google-chrome"
" let g:haskell_conceal = 0



" --- --- --- TERMINAL SETUP --- --- ---

let &t_IS .= "\<Esc>[5 q"
let &t_EI .= "\<Esc>[1 q"

if !has('nvim')
    set t_Co=256
endif

if has('mouse')
  set mouse=a
endif

set background=dark
colorscheme wal


if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif



" --- --- --- BASIC 'SET'TINGS --- --- ---

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

inoremap jj <ESC>

set lazyredraw
if !has('nvim')
    set ttyfast
endif

set ruler
set number

if has("vms")
  set nobackup
else
  set backup
  set undofile
endif
set history=50
set showcmd
set incsearch

" let maplocalleader = '\\'

set backspace=indent,eol,start

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline
set nocursorline
set relativenumber

set list listchars=tab:»»,trail:·  " not trailing

set swapfile
set dir=~/.vim/tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp



" --- BUFFERS (<leader>b) ---
set hidden
nmap <leader>bl :bnext<CR>
nmap <leader>bh :bprevious<CR>
nmap <leader>be :enew<CR>

set splitbelow
set splitright



" --- --- --- KEYBINDINGS --- --- ---

" Insert mode undo removes lines
inoremap <C-U> <C-G>u<C-U>

" Please no EX mode
map Q :

" Disable arrow keys.
nnoremap <Left> :echoe "Use h, pleb!"<CR>
nnoremap <Right> :echoe "Use l, pleb!"<CR>
nnoremap <Up> :echoe "Use k, pleb!"<CR>
nnoremap <Down> :echoe "Use j, pleb!"<CR>

" Change splits with ctrl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" In normal mode <CR> disables search highlights
nnoremap <CR> :noh<CR><CR>

" Map backspace to last buffer, disable Del
inoremap <BS> <C-S-^>
inoremap <Del> <Nop>
nnoremap <BS> <C-S-^>

" Terminal (<leader>t)
tnoremap jj <C-\><C-n>
nnoremap <leader>tt :term<CR>i

" Make (<leader>m)
nnoremap <leader>mm :make<CR>
nnoremap <leader>ml :!latexmk<CR>

" Windows management (<leader>w)
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
" quit
nnoremap <leader>wq <C-w>q
" close all others
nnoremap <leader>wo <C-w>o
" to new tab
nnoremap <leader>wt <C-w>T
" equalize size
nnoremap <leader>w= <C-w>=
" rotate
nnoremap <leader>wr <C-w>R

" Tabs (<leader>t --- shared with terminal!)
nnoremap <leader>tq :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tn :tabedit<CR>
nnoremap <leader>tl :tabn<CR>
nnoremap <leader>th :tabp<CR>
nnoremap <leader>t1 :tabfirst<CR>


" --- --- --- UTILITY SETTINGS, FUNCTIONS & STUFF --- --- ---

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Diff for buffer!
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

function! s:RemoveTrailingWhitespaces()
    " Save last cursor position
    let l = line(".")
    let c = col(".")

    %s/\s\+$//ge

    call cursor(l,c)
endfunction

au BufWritePre * :call <SID>RemoveTrailingWhitespaces()

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward

  " compatible).
  set langnoremap
endif
