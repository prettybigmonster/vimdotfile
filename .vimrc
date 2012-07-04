set nocompatible

filetype off 
" silent! call pathogen#helptags()
" silent! call pathogen#runtime_append_all_bundles()

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set mouse=a

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

syntax on

"Write the old file out hen switching between files
set autowrite

"Display current cursor position in lower right corner
set ruler

"set verbose

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ %y\ CWD:\ %r%{CurDir()}%h\ \ \%=Line:\ %l/%L:%c

" Crdictionary for custom expansions
set dictionary+=/Users/shoffman/.vim/dict.txt

set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css

autocmd BufNewFile,BufRead *.jspf set ft=jsp

au BufRead,BufNewFile *.json setf json

"autocomplete dropdown menu
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"eo autocomplete dropdown menu

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/Hoffman/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" Netrw Tree View
let g:netrw_liststyle=3

"Show line numbers
set number

"Switch between buffers without saving
set hidden

"Set global backup Directory
set backupdir=~/.vim/.vimtmp,.
set directory=~/.vim/.vimtmp,.

"Set the color scheme.
" colorscheme jellybeans
"colorscheme blackboard
"
let g:tagbar_ctags_bin = '/Users/Hoffman/local/cTags/bin/ctags'
" let Tlist_Ctags_Cmd = '/Users/Hoffman/local/bin/ctags'
" let Tlist_Use_Right_Window=1
" let Tlist_WinWidth=20
" let Tlist_javascript_Hide_Extras=['type']

if has("gui_running")
   set go-=T
"   set t_Co=256
"   set background=dark
   colorscheme blackboard
else
"   colorscheme jellybeans
   set background=dark
endif

" Don't update the display while executing macros
set lazyredraw

"Tab stuff
set tabstop=2
set shiftwidth=3
set softtabstop=3
set expandtab

"Set font family and size
"set guifont=Lucida\ Console:h11
"set guifont=DejaVu\ Sans\ Mono:h11
"set guifont=FreeMonoBold:h11
"set guifont=Andale\ Mono:h11
"set guifont=Monaco:h11
set guifont=Menlo:h10
"set guifont=Courier:h11
"set guifont=Inconsolata:h12

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Set Line Height
set linespace=4


"Hide MacVim toolbar by default
"set go-=T

"better line Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Set case insensitive search
set ignorecase
set smartcase

set wildmode=longest:full

" More useful command-line completion
set wildmenu

"Enable code folding
set foldenable

"disable seach highlighting
set nohlsearch

" Turn off bells and flashes
set noerrorbells
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif

" No sound on errors
" set vb
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500

"Hide mouse when typing
set mousehide

"Split windows below the current window.
set splitbelow

nnoremap <leader>ft vatzf

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

abbrev ff :! open -a firefox.app %<cr>
abbrev chrm :! open -a google\ chrome.app %<cr>
abbrev safari :! open -a safari.app %<cr>

abbrev llorem Lorem ipsum dolor sit amet, sed vestibulum nonummy, magna et et. Justo vitae. Laoreet amet, amet auctor lacus, dis ultricies. In eget metus. Eget posuere quisque, in ante ante. Mi fermentum in, lacinia libero nam.

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

"shortcut to Next buffer
nmap ,b :bn<cr>

let g:user_zen_expandabbr_key = '<D-e>'
let g:use_zen_complete_tag = 1

"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.DS_Store$', '\.svn$', '\.git$', '\.gitignore$']

nmap ,nt :NERDTreeToggle<cr>
nmap ,tb :TagbarToggle<cr>
"nmap <leader>tl :TlistToggle<cr>

if has("autocmd") 
	autocmd bufwritepost .vimrc source  $MYVIMRC
endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

:inoremap ( ()<Esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"This sorts CSS properties alphabetically just by  typing ,S
"nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
":command! SortCSS :g#\({\n\)\@<=#.,/}/sort
"nnoremap <S-F7> zRgg:while search("{$", 'W') \| .+1,/}$/-1sort \| endwhile<CR>

