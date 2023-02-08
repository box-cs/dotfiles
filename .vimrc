syntax on

filetype plugin indent on
set exrc
set secure
set noerrorbells
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nowrap
set noswapfile
set nobackup
set number
set undofile
set undodir=~/.vim/undodir
set incsearch
set scrolloff=12
set encoding=utf-8 
set colorcolumn=90
set signcolumn=yes
set termguicolors
set t_Co=256
syntax on

call plug#begin('~/.vim/plugged')
Plug 'universal-ctags/ctags'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'lyuts/vim-rtags'
Plug 'ycm-core/YouCompleteMe'
Plug 'prabirshrestha/vim-lsp'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
call plug#end()

"Rust -- logrocket configuring vim rust dev
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if has('termguicolors')
  set termguicolors
endif
" Theme:
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'atlantis'
"let g:sonokai_enable_italic = 1"
let g:sonokai_disable_italic_comment = 1
let g:airline_theme = 'sonokai'
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme sonokai
set background=dark

" Shortcuts:
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
