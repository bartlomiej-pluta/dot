" Control with mouse
set mouse=a

" Searching
set hlsearch   " Enable search results higlighting
set incsearch  " Enable incremental searching
set ignorecase " Ignore case when searching
set smartcase  " Disable ignorecase option when one letter at least is upper

" Disable confirming the willing to switch buffer
set hidden

" Enable autosyntax highlighting
syntax on

" Enable autoindentation
set autoindent

" Set tab size (tab stop)
set ts=3

" Replace tabs with spaces
" How many spaces is going to replace a tab
set expandtab
set sts=3

" How much do I have to move the indentation
" (shfit width)
set sw=3

"Set encoding
set encoding=utf-8
set fileencodings=usc-bom,utf-8,latin2
" set termencoding=utf-8

" Set info about file
set ruler
set rulerformat=%40(%y/%{&fenc}/%{&ff}%=%l,%c%V%5(%P%)%)

" Enable numbering lines
set number

" Show tab and spaces characters at the end of the lines
set list
set listchars=trail:_,tab:>-

" Enable backspacing over autoindent, line breaks and the start of insert
set backspace=indent,eol,start

" How many characters in lineshould be colored according to syntax highlighting
" Useful with really long oneline files, like XML or HTML
set synmaxcol=316

" History size"
set history=1000

" Enable hints for commands and file autocompletion
set wildmenu

" Remember cursor position after editor is shutdown
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") |
    \ exe "normal `\"" | endif

" Switch buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>
