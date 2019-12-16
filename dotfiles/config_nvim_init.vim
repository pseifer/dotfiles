" --- --- --- CORE --- --- ---
" ----------------------------
if !has('nvim')
    set nocompatible
endif

filetype off

" Encoding is UTF-8.
set encoding=utf-8

" Space is leader.
nnoremap <SPACE> <Nop>
let mapleader = ' '
let maplocalleader = ' '

set ttimeout
set ttimeoutlen=20
set timeoutlen=1000



" --- --- --- VUNDLE PACKAGE MANAGEMENT --- --- ---
" -------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ~ Essential plugins
Plugin 'scrooloose/nerdtree'               " Directory Tree
Plugin 'christoomey/vim-tmux-navigator'    " TMUX to VIM navigation
Plugin 'tpope/vim-surround'                " Matching parens stuff
Plugin 'junegunn/fzf.vim'                  " super-fuzzy finder for all things
Plugin 'easymotion/vim-easymotion'         " <Leader><Leader> number nie wieder
Plugin 'w0rp/ale'                          " code analysis / linting
Plugin 'tpope/vim-fugitive'                " git integration (:G)
Plugin 'airblade/vim-gitgutter'            " git status information
Plugin 'SirVer/ultisnips'                  " Snippet Engine
Plugin 'honza/vim-snippets'                " Snippet completion

"Plugin 'vim-syntastic/syntastic'          " slower ALE
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " completion

" ~ Language plugins
Plugin 'jceb/vim-orgmode'                  " ORG mode for vim
"Plugin 'parsonsmatt/intero-neovim'         " Haskell (intero)
Plugin 'eagletmt/ghcmod-vim'               " Haskell
Plugin 'Shougo/vimproc'                    " Haskell
Plugin 'ensime/ensime-vim'                 " Scala dev with ensime
Plugin 'derekwyatt/vim-scala'              " Scala
Plugin 'ktvoelker/sbt-vim'                 " SBT support
Plugin 'lervag/vimtex'                     " LaTeX Support

" ~ Themes & Stuff
Plugin 'vim-airline/vim-airline'           " Nice statusline
Plugin 'vim-airline/vim-airline-themes'    " Themes for airline
Plugin 'dylanaraps/wal.vim'                " Theme for pywal integration

" ~ Currently NOT USED
"Plugin 'dag/vim2hs'                        " Haskell Mode
"Plugin 'eagletmt/neco-ghc'                 " Deoplete GHC
"Plugin 'lukerandall/haskellmode-vim'
"Plugin 'ctrlpvim/ctrlp.vim'                " Open stuff
"Plugin 'jeetsukumaran/vim-buffergator'     " Buffer changer
"Plugin 'chriskempson/base16-vim'           " Base 16 themes
"Plugin 'jnurmine/Zenburn'                  " Zenburn theme

" --help
" Formats GitHub repo, git url, file path, vim-scripts.org
" :PluginList
" :PluginInstall
" :PluginUpdate
" :PluginSearch
" :PluginsClean

call vundle#end()
filetype plugin indent on



" --- --- --- PLUGIN CONFIGURATION --- --- ---

" --- VIMTEX ---
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

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
set rtp+=~/.programs-from-git/fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fw :Windows<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fa :Ag<CR>
" CTRL-T  | CTRL-X    | CTRL-V
" new tab | new split | new vsplit

" --- HASKELL ---
" au Bufenter *.hs compiler ghc
" :let g:haddock_browser="/usr/bin/google-chrome"
" let g:haskell_conceal = 0

let g:airline#extensions#ale#enabled = 1

nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>



" --- deoplete ---
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"



" --- ensime ---
autocmd BufWritePost *.scala silent : EnTypeCheck             " typecheck on write
au FileType scala nnoremap <leader>ss :EnType<CR>             " [t]ype check
au FileType scala nnoremap <leader>sj :EnDeclaration<CR>      " [j]ump to
au FileType scala nnoremap <leader>sv :EnDeclarationSplit<CR> " [v]split jump to
au FileType scala nnoremap <leader>sr :EnRename<CR>           " [r]ename
au FileType scala nnoremap <leader>si :EnSuggestImport<CR>    " [i]mport
au FileType scala nnoremap <leader>sf :EnSearch<CR>           " [f]ind term
au FileType scala nnoremap <leader>su :EnUsages<CR>           " [u]usage search
au FileType scala nnoremap <leader>sb :EnInstall<CR>          " [b]ootstrap



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

set clipboard=unnamedplus

" --- --- --- BASIC 'SET'TINGS --- --- ---

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

set ignorecase      " search case insensitive
set smartcase       " unless query has uppercase
set gdefault        " substitution uses 'g' by default

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

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
nnoremap ; :

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
" inoremap <BS> <C-S-^>
" inoremap <Del> <Nop>
" nnoremap <BS> <C-S-^>

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

set nomodeline
