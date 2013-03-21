set nocompatible

" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

" No swapfile, please
set noswapfile
" Undos will be gone after reboot, which should be safe
set undodir="/tmp/.vimundodir"
" Set undo history size
set history=10000

set bs=2 "set backspace to be able to delete previous characters
" Enable line numbering, taking up 6 spaces
set number
set ruler

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Turn off word wrapping
set wrap!

" Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
set softtabstop=2
set smarttab

"turn tabs into whitespace
set expandtab

"indent width for autoindent
set shiftwidth=2
"indent depends on filetype
"filetype plugin on
"filetype plugin indent on

" Shortcut to auto indent entire file
nmap <leader>i 1G=G
imap <leader>i <ESC>1G=Ga

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Don't beep etc.
set visualbell
" Set color scheme
set t_Co=2
colorscheme slate
syntax enable

" Enable indent folding
set foldenable
set fdm=syntax
" Only fold if token is longer than fml lines
set fml=50

" Set space to toggle a fold
nnoremap <space> za

" Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

" Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e 

" Jumps to matching brace
noremap % v%

" Briefly jump to matching brace
set showmatch
set matchtime=3

" Actually scrolls screen
" inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
" inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
" inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Quicker vertical movement
nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k
inoremap <C-j> <ESC>10j
inoremap <C-k> <ESC>10k

" Make Y behave like other capitals
map Y y$

" Reset visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Re-maps tab movement so it corresponds to normal movement keys hjkl
" but with CTRL pressed.
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" Open <TAB>-menu for autocomplete options
set wildmenu

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

" Sets <Leader> to ,
let mapleader=","

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Highlight everything over 80 columns
"highlight OverLength ctermbg=red ctermfg=white guibg=#88AEE4
"match OverLength /\%81v.\+/

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
vnoremap %s/ %s/\v
nnoremap %s/ %s/\v
vnoremap s/ s/\v
nnoremap s/ s/\v
vnoremap ? ?\v
nnoremap ? ?\v

" Command mode acts like a shell only with hjkl as arrow keys.
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

set encoding=utf-8

" Move up/down by visual linebreak rather than actual newlines
noremap j gj
noremap k gk
" Skip through wrapped lines
noremap gj j
noremap gk k

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Isn't this default behavior? Whatever.
nnoremap D d$

" <m-j> and <m-k> to drag lines in any mode (German layout)
nnoremap º mz:m+<CR>`z==
nnoremap ∆ mz:m-2<CR>`z==
inoremap º <Esc>:m+<CR>==gi
inoremap ∆ <Esc>:m-2<CR>==gi
vnoremap º :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap ∆ :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Same as above, only with alt as defined on several unix flavors
nnoremap ^]j mz:m+<CR>`z==
nnoremap ^]k mz:m-2<CR>`z==
inoremap ^]j <Esc>:m+<CR>==gi
inoremap ^]k <Esc>:m-2<CR>==gi
vnoremap ^]j :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap ^]k :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Save on focus lost
au FocusLost * :wa

" Custom Invisibles
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set list
set showbreak=↪

" Select all text in current buffer
map <Leader>a ggVG

" Restore cursor position and foldings after launch
set viewoptions=cursor,folds,slash,unix

" Write and re-source immediately
noremap <leader>w :w<CR>
noremap <leader>s :so ~/.vimrc<CR>
noremap <leader>r :!!<CR>
vnoremap <leader>R :!irb1.9 -r <C-R>"<CR>

" Quit vim quickly
noremap <leader>Q :qa!<CR>
noremap <leader>q :qa<CR>

" Write all buffers
noremap <leader>wa :wa<CR>

" Use tab instead of awkwardly placed keys
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

function! g:copyToPasteBoard()
  normal! gv
  silent '<,'>w !pbcopy
endfunction
vnoremap <leader>y :<c-u>call g:copyToPasteBoard()<CR>

" Give a shortcut key to NERD Tree
map <leader>n :NERDTreeToggle<CR>
"Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Tell syntastic which checker to use for what language
let g:syntastic_ruby_checkers=['mri']
let g:syntastic_c_checkers=['gcc']
let g:syntastic_zsh_checkers=['zsh']
let g:syntastic_sh_checkers=['sh']
let g:syntastic_java_checkers=['javac']

" Return a corresponding parent to be sent to the buffer
function! CloseParen()
  let parenpairs = {'(' : ')',
        \  '[' : ']',
        \  '{' : '}'}

  let [m_lnum, m_col] =
  searchpairpos('[[({]', '',
  '[\])}]', 'nbW')

  if (m_lnum != 0) && (m_col
    != 0)
    let c =
    getline(m_lnum)[m_col
    - 1]
    return
    parenpairs[c]
  endif
  return
  ''
endfun

imap <C-e> <C-r>=CloseParen()<CR>

" Rails bindings
nnoremap ,a :A<CR> 
nnoremap ,r :R<CR>
nnoremap ,m :Rmodel<CR> 
nnoremap ,v :Rview<CR>
nnoremap ,c :Rcontroller<CR>

" Resize windows quickly
nnoremap ,> <c-w>10>
nnoremap ,< <c-w>10<

" Useful buffer switching
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Show encoding in statusline, e.g. [utf-8]
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
