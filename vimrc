autocmd!

set nocompatible
filetype off

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

set rtp+=$GOROOT/misc/vim

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" NerdTree
" NeoBundle 'scrooloose/nerdtree'
" NerdTree Tabs
" NeoBundle 'jistr/vim-nerdtree-tabs'

" VimProc
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
" Unite.vm
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" CtrlP
NeoBundle "kien/ctrlp.vim"

"
" Unite source
" NeoBundle 'h1mesuke/unite-outline'

" Surround
" NeoBundle "tpope/vim-surround"

" Airline (status-bar yet another powerline)
" NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'Lokaltog/vim-powerline'
" vim-fugitive
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv.git'
" GitGutter
NeoBundle 'airblade/vim-gitgutter'

" Syntastic
NeoBundle 'scrooloose/syntastic'
" Tagbar
" NeoBundle 'majutsushi/tagbar'

" Vim Over
NeoBundle 'osyo-manga/vim-over'
" Dash.app
" NeoBundle 'rizzatti/funcoo.vim'
" NeoBundle 'rizzatti/dash.vim'

" Vim Multi cursor
" NeoBundle 'terryma/vim-multiple-cursors'

" YankRing
NeoBundle 'LeafCage/yankround.vim'

" ChooseWin
NeoBundle 't9md/vim-choosewin'

" Quick-Run
NeoBundle "thinca/vim-quickrun"
" Open Browser
NeoBundle 'tyru/open-browser.vim'

" neocomplcache
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
" tern
NeoBundle 'marijnh/tern_for_vim'

NeoBundle 'pangloss/vim-javascript'

" Coffeescript
NeoBundle 'kchmck/vim-coffee-script'

" Node.js
"NeoBundle 'myhere/vim-nodejs-complete'

" GLSL
NeoBundle 'tikhomirov/vim-glsl'

" C++
" NeoBundle 'justmao945/vim-clang'
NeoBundleLazy 'Rip-Rip/clang_complete', {
      \ 'autoload': {'filetype': ['cpp','hpp','h'] }
      \ }
NeoBundleLazy 'vim-jp/cpp-vim', {
      \ 'autoload': {'filetype': ['cpp','hpp','h'] }
      \ }

" NeoBundleLazy 'osyo-manga/vim-marching', {
"       \ 'depends': ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
"       \ 'autoload': {'filetype': ['c','cpp'] }
"       \ }
" NeoBundle 'Valloric/YouCompleteMe'

" CSS3
NeoBundle 'hail2u/vim-css3-syntax'
" Jade
NeoBundle 'digitaltoad/vim-jade'
" Stylus
NeoBundle 'wavded/vim-stylus'
" Yaml
NeoBundle 'stephpy/vim-yaml'
" Markdonw
NeoBundle 'tpope/vim-markdown'

" Markdonw preview
NeoBundle 'kannokanno/previm'

" color table
" NeoBundle "guns/xterm-color-table.vim"
"
NeoBundle 'editorconfig/editorconfig-vim'

" Color Schemes
" NeoBundle 'tomasr/molokai'
NeoBundle 'goatslacker/mango.vim'
" NeoBundle 'Lokaltog/vim-distinguished'
" JS Scope Context Coloring
" NeoBundle 'bigfish/vim-js-context-coloring'

" ====================
" generic options
" ====================
set nobackup
set noswapfile
set incsearch

" ====================
" visual options
" ====================
filetype plugin indent on
set showmode
set title
set ruler
set showcmd
set showmatch
set laststatus=2
set cursorline
set ttyfast
" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" spaces
set list
set listchars=tab:»-

" ====================
" programming
" ====================
" set smartindent
set cindent
set smartcase
set wrapscan
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent

" ====================
" mouse options
" ====================
if has("mouse")
  set mouse=a
endif

" ====================
" search
" ====================
set ignorecase

" ====================
" clip board
" ====================
set clipboard=unnamed,autoselect

" ====================
" file encoding
" ====================
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" ====================
" key binds
" ====================

" disable help
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>
" :nmap <C-N><C-N> :set invnumber<CR>

" tag key map
nnoremap <silent> <C-t>l :tabnext<CR>
nnoremap <silent> <C-t>h :tabprev<CR>
nnoremap <silent> <C-t>c :tabclose<CR>
nnoremap <silent> <C-t>n :tabnew<CR>
for n in range(1,9)
  execute 'nnoremap <silent> <C-t>'.n ':tabnext '.n.'<CR>'
endfor

" ====================
" ctrlp
" ====================
" let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 1
" let g:ctrlp_working_path_mode   = 'ra'
let g:ctrlp_mruf_max            = 500
let g:ctrlp_custom_ignore = 'DS_Store\|\.git\|\.hg\|\.svn\|optimized\|compiled\|node_modules\|bower_components'
let g:ctrlp_open_new_file       = 1

" ====================
" unite
" ====================
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
nmap <silent><buffer> <ESC><ESC> q
imap <silent><buffer> <ESC><ESC> <ESC>q
nnoremap [unite] <Nop>
nmap <Leader>u [unite]

nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir file_mru<CR>
nnoremap <silent> [unite]u :<C-u>Unite file_mru<CR>
" nnoremap <silent> [unite]k :<C-u>Unite bookmark<CR>
" nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

" unite yank history
let g:unite_source_history_yank_enable = 1
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

" let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 200
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opts = ''
let g:unite_source_grep_max_candidates = 200

vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" ====================
" VimFiler
" ====================
nnoremap <silent> [unite]e :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" ====================
" Tagbar
" ====================
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" ====================
" Yankround
" ====================
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-k> <Plug>(yankround-prev)
nmap <C-j> <Plug>(yankround-next)

" ====================
" GitGutter
" ====================
nnoremap <silent> ,gn :GitGutterNextHunk<CR>
NeoBundleFetch 'Shougo/neobundle.vim'

" ====================
" LightLine
" ====================
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode'],
      \     ['readonly', 'fugitive', 'filename', 'modified']
      \   ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"*":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

" ====================
" ChooseWin
" ====================
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1

" ====================
" neocomplete
" ====================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_ignore_case = 1
" let g:neocomplete#max_list = 5
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_fuzzy_completion = 1

" let g:neocomplete#force_overwrite_completefunc = 1
" let g:neocomplete#force_omni_input_patterns = {}
" let g:neocomplete#force_omni_input_patterns.c =
"       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:neocomplete#force_omni_input_patterns.cpp =
"       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:neocomplete#force_omni_input_patterns.objc =
"       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:neocomplete#force_omni_input_patterns.objcpp =
"       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

autocmd FileType javascript setlocal omnifunc=tern#Complete
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ====================
" neo-snippets
" ====================
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/snippets'

" ====================
" clang_complete
" ====================
" Disable auto completion, always <c-x> <c-o> to complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
let g:clang_complete_copen = 1
"" let g:clang_debug=1
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib'
let g:clang_user_options = '-std=c++11 -stdlib=libc++'

" ====================
" vim_clang
" ====================
" let g:clang_auto = 1
" let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
" let g:clang_cpp_completeopt = 'longest,menuone'
" let g:clang_cpp_options = ''

" ====================
" vim_marching
" ====================
" let g:marching_clang_command = '/usr/bin/clang'
" let g:marching_clang_command_option = '-std=c++11'
" let g:marching_include_paths = ['/usr/include/c++/4.2.1']
" let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
"
" ====================
" YouCompleteMe
" ====================
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_filepath_completion_use_working_dir = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ====================
" syntastic
" ====================
let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': ['html','cpp']
      \}
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_cpp_compiler = '/usr/bin/clang'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" ====================
" color scheme
" ====================
syntax enable
set t_Co=256
set background=dark
colorscheme mango
"colorscheme proteus
"colorscheme molokai
"colorscheme distinguished

" Adjust omnifunc pop menu
highlight Pmenu ctermbg=179 ctermfg=16 cterm=bold
highlight CursorLine ctermbg=237
" Color Scheme for javascript
highlight jsFunction ctermfg=105
highlight jsFuncName ctermfg=111
highlight jsFuncArgs ctermfg=211
highlight jsObjectKey ctermfg=141
highlight jsFunctionKey ctermfg=141
highlight Noise ctermfg=216

" ====================
" file types
" ====================
au! BufRead,BufNewFile *.json set filetype=javascript
" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" ====================
" disable IME when pushed ESC
" ====================
set imdisable

" ====================
" font settings
" ====================
" set guifont=Monaco:h10
" set guifontwide=Monaco:10
" set noantialias

