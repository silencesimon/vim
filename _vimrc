" don't make Vi-compatible
set nocompatible

" display line number. (set nu)
set number

" Set tabstop to tell vim how many columns a tab counts for.
set tabstop=4

" Set softtabstop to control how many columns vim uses when you hit Tab in
" insert mode. If softtabstop is less than tabstop and expandtab is not set,
" vim will use a combination of tabs and spaces to make up the desired
" spacing. If softtabstop equals tabstop and expandtab is not set, vim will
" always use tabs. When expandtab is set, vim will always use the appropriate
" number of spaces.
set softtabstop=4

" When expandtab is set, hitting Tab in insert mode will produce
" the appropriate number of spaces.
set expandtab

" Set shiftwidth to control how many columns text is indented with the
" reindent operations (<< and >>) and automatic C-style indentation.
set shiftwidth=4

" when cursor stays at one of the [],(),{}, highlight the other.
set showmatch

" wrap the line when line is too long.
set wrap

" Show the line and column number of the cursor position.
set ruler

" highlight searching results.
set hlsearch

" By default, searching starts after you enter the string. With `incsearch`
" set, the Vim editor will start searching when you type the first character of the
" search string. As you type in more characters, the search is refined.
set incsearch

" This turns on C style indentation. Each new line will be automatically
" indented the correct amount according to the C indentation standard.
"set cindent


" Setup the colors for syntax highlighting. (syntax enable)
syntax on

" when on, enable file type detection.
" turn this off, required by vundle.
filetype off

"###############################################
" Vundle
"###############################################
" set the runtime path to include Vundle and initialize
set rtp+=%HOME%/vimfiles/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'FuzzyFinder'
Plugin 'bufexplorer.zip'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Mark--Karkat'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'L9'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"###################################################


" You can enable loading the indent file for specific file types.
"filetype indent on
" You can enable loading the plugin files for specific file types.
"filetype plugin on
filetype plugin indent on


" set number of colors.
" avoid terminal vim to display abnormal.
set t_Co=256

" set terminal vim colorscheme
set background=dark
colorscheme solarized

" By default, when pressing left/right cursor keys, Vim will not move to the
" previous/next line after reaching first/last character in the line. This can
" be quite annoying for new users. Fortunately this behaviour can be easily
" changed by putting this in your vimrc file:
set whichwrap+=<,>,h,l,b,s,[,]

" The *.ext~ file is a backup file, containing the file as it was before you
" edited it.
" To switch off automatic creation of backup files, use this:
set nobackup

" The *.ext.swp file is the swap file, which serves as a lock file and
" contains the undo/redo history as well as any other internal info Vim needs.
" In case of a crash you can re-open your file and Vim will restore its
" previous state from the swap file (which I find helpful, so I don't switch
" it off).
"set noswapfile



" By default, hitting backspace will only delete what has been inserted in the
" current insert mode and on the current line. This makes deleting in insert mode
" very difficult.
"
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"         stop once at the start of insert.
set backspace=indent,eol,start



" The 'fileformat' option is local to each buffer. It is set by Vim when a
" file is read, or can be specified in a command telling Vim how to read a
" file. In addition, the 'fileformat' option can be changed to specify the
" line endings that will be added to each line when the buffer is written to a
" file.
set ff=unix

" The 'fileformats' option is global and specifies which file formats will be
" tried when Vim reads a file (unless otherwise specified, Vim attempts to
" automatically detect which file format should be used to read a file). The
" first file format in 'fileformats' is also used as the default for a new
" buffer.
" comment to hide ^M symbol
"set ffs=unix

" The following command displays the fileformat option (abbreviated as ff) for
" the current buffer, and the fileformats global option (abbreviated as ffs)
" which determines how Vim reads and writes files
" :set ff? ffs?


" Sets the character encoding used inside Vim.
set enc=utf-8
" Sets the character encoding for the file of this buffer.
" When 'fileencoding' is different from 'encoding', conversion will be
" done when writing the file.
set fenc=utf-8
" This is a list of character encodings considered when starting to edit
" an existing file.  When a file is read, Vim tries to use the first
" mentioned character encoding.  If an error is detected, the next one
" in the list is tried.  When an encoding is found that works,
" 'fileencoding' is set to it.
"
" Ucs-bom is "ucs with byte-order-mark"
" cp936 is GBK
set fencs=ucs-bom,utf-8,cp936

" Only effective when 'encoding' is "utf-8" or another Unicode encoding.
" Tells Vim what to do with characters with East Asian Width Class
" Ambiguous (such as Euro, Registered Sign, Copyright Sign, Greek
" letters, Cyrillic letters).
set ambiwidth=double


" display a highlight column
"set colorcolumn=80

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Highlight the screen line of the cursor.
set cursorline

" Don't ring the bell (beep or screen flash) for error messages. This only
" makes a difference for error messages, the bell will be used always
" for a lot of errors without a message (e.g., hitting <Esc> in Normal
" mode).
set noerrorbells


" To make all yanking/deleting operations automatically copy to the system
" clipboard. (works in OSX, Windows)
set clipboard+=unnamed

" set mapleader key
let mapleader = ","


" copy to system clipboard.
map <leader>y "+y
" paste from system clipboard.
map <leader>p "+p

" %F: File path
" %y: Type of file
" %r: Readonly flag
" %m: Modified flag
" %{&ff}: File format
" %l: Line number
" %L: Number of lines in buffer
" %c: Column number
" %p: Percentage through file in lines as in |CTRL-G|
" %o: Byte number in file of byte under cursor
set statusline=[%F]%y%r%m[%{strlen(&fenc)?&fenc:'none'}][%{&ff}]%=[%l/%L,%c][%p%%][%o]

" Number of screen lines to use for the command-line.
set cmdheight=1

" The value of this option influences when the last window will have a
" status line:
"         0: never
"         1: only if there are at least two windows
"         2: always
set laststatus=2

" When 'confirm' is on, certain operations that would normally
" fail because of unsaved changes to a buffer, e.g. ":q" and ":e",
" instead raise a |dialog| asking if you wish to save the current
" file(s).
set confirm




" Remove trailing whitespace when writing a buffer, but not for diff (From Vigil)
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")

        " Remove trailing whitespace
        silent! %s/\s\+$//

        " To change all the existing tab characters to match the current tab settings.
        "silent! retab!

        " Remove trailing ^M
        " ^M is a visual representation of DOS/Windows line-ending character '\r'
        " You can also use :%s/^M//g
        " To get ^M, hold CTRL and press V then M
        "silent! %s/$//g

        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()



function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "
"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "
"
    elseif a:direction == 'gv'
        execute "noautocmd vimgrep " . "/" . l:pattern . "/gj" . " **/*"
        execute "cw"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! VisualSelection_ack(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\"`$')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'ga' || a:direction == 'gv'
        execute "Ack! " . "\"" . l:pattern . "\""
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection_ack('gv')<CR>
" Use Ack search
vnoremap <silent> ga :call VisualSelection_ack('ga')<CR>




" ###############################################
" Plugin config
" ###############################################


" BufExplorer
nnoremap <leader>be :BufExplorer<CR>
nnoremap <leader>bs :BufExplorerHorizontalSplit<CR>
nnoremap <leader>bv :BufExplorerVerticalSplit<CR>

" Mark
nnoremap <leader>c :MarkClear<CR>

" Nerdtre
nnoremap <leader>tr :NERDTree<CR>

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

" ctags setting
set tags=tags
map <F9> <Esc>:!ctags -R *<CR>




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
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" ###############################################



" Tagbar
nnoremap <leader>tt :TagbarToggle<CR>



" ###############################################
" EasyMotion
" ###############################################
let g:EasyMotion_do_mapping = 0 "Disable default mappings

let g:EasyMotion_smartcase = 1  "Turn on case insensitive feature

" Bi-directional find motion
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-s2)
" Replace build-in '/'
map / <Plug>(easymotion-sn)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" ###############################################



" ###############################################
" YouCompleteMe
" ###############################################
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_invoke_completion = '<C-X>'
" ###############################################


" ###############################################
" ack.vim
" ###############################################
let g:ackprg = 'ag --vimgrep -Q'
let g:ackhighlight = 1
" ###############################################
