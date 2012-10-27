syntax on

colorscheme vividchalk-c
" colorscheme ir_black
set hidden
set background=light
set guifont=Source\ Code\ Pro:h13
" set guifont=Monaco:h13
set linespace=3
set lines=65
set columns=80
set spell
set number
filetype plugin on

":inoremap ( ()<Esc>i
":inoremap { {}<Esc>i
":inoremap [ []<Esc>i
":inoremap ' ''<Esc>i
":inoremap " ""<Esc>i

set expandtab
set smarttab
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set nowrap

set laststatus=2
set statusline=[%n]\ %{fugitive#statusline()}\ %{rails#statusline()}\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l,%c-%v\ %)%P
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR> 
nmap <C-W>! <Plug>Kwbd
if has("gui_running")
  colorscheme vividchalk-c
  set guioptions=-t
  set fuopt+=maxhorz
" set fu

endif

" show the right column. requires a recent version of vim
set colorcolumn=80

" color text that goes over the length
highlight OverLength ctermfg=red
match OverLength /\%>80v.\+/""

set wrapmargin=8
set ruler

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¶
set list

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Be angry when trailing whitespace exists
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/


" maximize the current window

" used for stripping trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" F5 to strip trailing whitespace
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
" Strip trailing whitespace on save
autocmd BufWritePre *.py,*.js,*.rb,*.rake,*.haml,*.coffee :call <SID>StripTrailingWhitespaces()

set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

call pathogen#infect()
