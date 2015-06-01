set nocompatible
set nu
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
"set smartindent
"set cindent
set showmatch
"set nowrap
set wrap
set ruler
set incsearch
set hlsearch

syntax on

"because of bundle, change to off
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'fatih/vim-go'
Bundle 'FuzzyFinder'
Bundle 'bufexplorer.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Mark--Karkat'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'zhisheng/visualmark.vim'
Bundle 'mileszs/ack.vim'
Bundle 'CmdlineComplete'
Bundle 'rosenfeld/conque-term'
Bundle 'L9'
Bundle 'tpope/vim-repeat'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'scrooloose/syntastic'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'


filetype indent on
filetype plugin on
filetype plugin indent on

set background=dark
colorscheme solarized


set whichwrap+=<,>,h,l,b,s,[,]

set nobackup
"set noswapfile

set backspace=indent,eol,start

set ff=unix
set ffs=unix

set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp936

set ambiwidth=double

" ctags setting
set tags=tags

"Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>


set cursorline
set noerrorbells

set clipboard+=unnamed
set statusline=[%F]%y%r%m[%{&ff}]%*%=[%l/%L,%c][%p%%]
set cmdheight=1
set laststatus=2
set confirm




"Remove trailing whitespace when writing a buffer, but not for diff fi
"From: Vigil
"http://kezeodsnx.pixnet.net/blog/post/25222797-vim%E8%87%AA%E5%8B%95%E5%8E%BB%E9%99%A4%E8%A1%8C%E6%9C%AB%E7%A9%BA%E7%99%BD%E5%8F%8A%E6%9C%80%E5%BE%8C%E7%9A%84%E7%A9%BA%E7%99%BD%E8%A1%8C
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        "silent! %s/\(\s*\n\)\+\%$//

        silent! retab!

        silent! %s/$//g
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()


function! My_compile_command()
  let l:ext = expand("%:e")
  let l:fullpath = expand("%:p")
  let l:int_path = "~/svn/int/server/"
  let l:patch_path = "~/svn/patch/server/"
  let l:release_path = "~/svn/release/server/"
  let l:tw_path = "~/svn/patch_tw/server/"
  if (l:ext == "erl")
      if strridx(fullpath, "tw") > 0
          exec "!erlc -I ".tw_path."include -o ".tw_path."ebin -pa ".tw_path."ebin +debug_info ".expand("%:p")
      elseif (strridx(fullpath, "patch") > 0)
          exec "!erlc -I ".patch_path."include -o ".patch_path."ebin -pa ".patch_path."ebin +debug_info ".expand("%:p")
      elseif (strridx(fullpath, "release") > 0)
          exec "!erlc -I ".release_path."include -o ".release_path."ebin -pa ".release_path."ebin +debug_info ".expand("%:p")
      elseif (strridx(fullpath, "int") > 0)
          exec "!erlc -I ".int_path."include -o ".int_path."ebin -pa ".int_path."ebin +debug_info ".expand("%:p")
      endif
  endif
  redraw
endfunction
nmap <C-A> :call My_compile_command()<cr>

"From an idea by Michael Naumann
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "noautocmd vimgrep " . '/'. l:pattern . '/gj' . ' **/*.c **/*.h'
        execute "cw"
    elseif a:direction == 'ga'
        execute "Ack " . l:pattern
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>
vnoremap <silent> ga :call VisualSelection('ga')<CR>

"Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

"When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


let mapleader = ","

"nmap <F3> ggVG== :w<CR>
"nnoremap ,b :ls<CR>:buffer<Space>


" BufExplorer
nnoremap <leader>be :BufExplorer<CR>
nnoremap <leader>bs :BufExplorerHorizontalSplit<CR>
nnoremap <leader>bv :BufExplorerVerticalSplit<CR>

"set colorcolumn=100

nnoremap <leader>c :MarkClear<CR>

nnoremap <leader>ct :ConqueTerm<Space>
nnoremap <leader>cts :ConqueTermSplit<Space>
nnoremap <leader>ctv :ConqueTermVSplit<Space>

nnoremap <leader>tr :NERDTree<CR>
"nnoremap <leader>tree :NERDTree<CR>

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Fuzzy Finder
nnoremap <leader>fa :FufCoverageFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>fl :FufLine<CR>
nnoremap <leader>ft :FufTag<CR>

map <F9> <Esc>:!ctags **/*<CR>

map <leader>y "+y
map <leader>p "+p




" ###############################################
" vim-go
" ###############################################
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <Leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" vim-go default `gd`
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" ###############################################



" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>



" ###############################################
" EasyMotion
" ###############################################
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" ###############################################



" ###############################################
" YouCompleteMe
" ###############################################
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
" ###############################################


" ###############################################
" Syntastic
" ###############################################
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let g:syntastic_c_checkers = ['gcc']
" ###############################################
