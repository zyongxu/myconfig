"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug-ins (use vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful vim-plug commands:
"   ':PlugInstall'  Install all plugins
"   ':PlugUpdate'   Install or update plugins
"   ':PlugClean[!]' Remove unlisted plugins (bang version will clean without prompt)
"   ':PlugUpgrade'  Upgrade vim-plug itself
"   ':PlugStatus'   Check the status of plugins
"   ':PlugDiff'     Examine changes from the previous update and the pending changes

call plug#begin('~/.vim/plugged')
" color scheme
Plug 'https://github.com/morhetz/gruvbox.git'
" latex syntax and autocomplete
Plug 'https://github.com/lervag/vimtex.git'
" fuzzy file search
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" use tabs to represent buffers
Plug 'https://github.com/ap/vim-buftabline.git'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings and Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"

" local leader is meant to be a prefix for mappings that only take
" effect for certain types of files, like .tex
let maplocalleader = "\\"

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Remove the Windows ^M when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" mapping for force writing when I forgot to start vim with sudo
cmap w!! %!sudo tee > /dev/null %

" mapping for ignoring white space diff in diff mode
set diffopt+=iwhite

" Close the current buffer
map <leader>bd :Bclose<cr>

" move among windows by Ctrl-h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" CTRL-Tab is next buffer
nnoremap <C-Tab> :bnext<CR>
" CTRL-SHIFT-Tab is previous buffer
nnoremap <C-S-Tab> :bprev<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax, Highlight and Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn on syntax highlighting
syntax on
syntax enable

" Enable filetype plugins
filetype plugin on
filetype indent on

" Turn on spell check for specific filetypes
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell spelllang=en_us

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Genearal Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic

" Set the current working directory as the directory of the file being edited
set autochdir

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
set tm=500

" Turn backup off, since most stuff is in git etc. anyway...
set nobackup
set nowb
set noswapfile

" unsaved buffers are hidden on close rather than actully being closed
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plug-in config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------ ctrlp.vim ------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Ctrl + n to start search
let g:ctrlp_map = '<c-n>'
" search by filename, not by path
let g:ctrlp_by_filename = 1
" regex style name matching
let g:ctrlp_regexp = 1
" use .gitignore to exclude files in the search
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"------------------ vimtex ------------------
" Use TexShop as the previewer in Mac
if has('mac') || has('macunix')
    let g:vimtex_view_general_viewer = '/Applications/TeX/TeXShop.app/Contents/MacOS/TeXShop'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox

" Turn on the WiLd menu
set wildmenu

" Show the partial command on the status bar
set showcmd

" Show current position
set ruler

" Show line number
set number

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" highlight column 110 with color
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" configs for GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  " set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %F%m%r%h\ %w\ \ \ Line:\ %l/%L\ (%p%%)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

