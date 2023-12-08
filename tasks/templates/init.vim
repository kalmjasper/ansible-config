set nocompatible
filetype off

set runtimepath+=~/.config/nvim/bundle/Vundle.vim
" set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/VimCompletesMe'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'preservim/nerdtree'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'preservim/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sainnhe/sonokai'
Plugin 'fatih/vim-go'
Plugin 'wincent/Command-T'


call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set history=1000

set t_Co=256

set mouse=

let g:airline_theme='sonokai'
colorscheme sonokai

nnoremap <C-t> :CommandT<CR>
map <C-e> :NERDTreeToggle<CR>
let g:CommandTPreferredImplementation='lua'

if executable('ruff-lsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ruff-lsp',
        \ 'cmd': {server_info->['ruff-lsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    " maybe yes? I lose lsp status if this is auto
    setlocal signcolumn=auto
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this :line

