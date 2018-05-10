if !has('nvim')
    set nocompatible
endif
filetype off
set encoding=utf-8



" --- --- --- VUNDLE PACKAGE MANAGEMENT --- --- ---

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'dag/vim2hs'
" Plugin 'Shougo/deoplete.nvim'
Plugin 'eagletmt/neco-ghc'
Plugin 'jceb/vim-orgmode'
Plugin 'jnurmine/Zenburn'
Plugin 'dylanaraps/wal.vim'
" Plugin 'eagletmt/ghcmod.vim'
" Plugin 'lukerandall/haskellmode-vim'

" Formats GitHub repo, git url, file path, vim-scripts.org
" :PluginList
" :PluginInstall
" :PluginUpdate
" :PluginSearch
" :PluginsClean

call vundle#end()
filetype plugin indent on



" --- --- --- PLUGIN CONFIGURATION --- --- ---

" --- AG.VIM ---
let g:ag_prg="/usr/bin/ag --vimgrep"  " set path to ag program

" --- NERDTREE ---
map <F10> :NERDTreeToggle<CR>
map <F9>  :NERDTreeFind<CR>

" --- airline ---
let g:airline_theme = 'wal'
set laststatus=2
let g:ariline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" --- CtrlP ---
" Note: More Settings under 'BUFFERS'
" Setup some default ignores
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
            \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
            \}
" Use nearest .git dir as cwd.
let g:ctrlp_working_path_mode = 'r'

" Deoplete
" let g:deoplete#enable_at_startup = 1


" --- HASKELL ---
" au Bufenter *.hs compiler ghc
" :let g:haddock_browser="/usr/bin/google-chrome"
let g:haskell_conceal = 0


" Config vim scheme for chicken
let b:is_chicken=1
setl lispwords+=let-values,condition-case,with-input-from-string
setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setl lispwords+=call-with-output-file

nmap <silent> == :call Scheme_indent_top_sexp()<cr>
fun! Scheme_indent_top_sexp()
    let pos = getpos('.')
    silent! exec "normal! 99[(=%"
    call setpos('.', pos)
endfun


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
" let base16colorspace=256
" colorscheme base16-eighties
colorscheme wal


if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif



" --- --- --- BASIC 'SET' SETTINGS --- --- ---

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

let mapleader = ','
" let maplocalleader = '\\'

set backspace=indent,eol,start

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

set list listchars=tab:»»,trail:·  " not trailing

nnoremap <Left> :echoe "Use h, pleb!"<CR>
nnoremap <Right> :echoe "Use l, pleb!"<CR>
nnoremap <Up> :echoe "Use k, pleb!"<CR>
nnoremap <Down> :echoe "Use j, pleb!"<CR>

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

nnoremap <CR> :noh<CiR><CR>

set swapfile
set dir=~/.vim/tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp



" --- --- --- BUFFERS --- --- ---
set hidden
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

let g:buffergator_viewport_split_policy = 'R'
"let g:buffergator_suppress_keymaps = 1

nmap <leader>jj :BuffergatorMruCyclePrev<CR>
nmap <leader>kk :BuffergatorMruCycleNext<CR>
nmap <leader>bl :BuffergatorOpen<CR>

nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>T :enew<CR>

set splitbelow
set splitright

" KEYBINDGS
" s = split, S = split and keep buffers
" i = vertikal
" d = delete
" ...



" --- --- --- NON-PERMANENT PLAYGROUND --- --- ---



" --- --- --- UTILITY SETTINGS AND FUNCTIONS --- --- ---

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







" --- --- --- THE "I DON'T KNOW WHAT IT DOES OR WHER IT COMES FROM BUT IM AFRAID
"  SOMETHING WILL BREAK IF I REMOVE IT" SECION --- --- ---

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>



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

