source ~/.vim/.commonrc

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-surround'
Plug 'nobe4/exchange.vim'
Plug 'tpope/vim-commentary'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-speeddating'
Plug 'chrisbra/NrrwRgn'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

map <Leader> <Plug>(easymotion-prefix)
map <Leader>f :FZF<CR>

set nu
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeChDirMode = 2
map <Leader>t :NERDTreeToggle<CR>
map <Leader>r :b #<CR>
nmap <Leader>e :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'



" set background=dark
colorscheme iceberg
syntax enable
let g:airline_theme='angr'

" python specific vim config things 
set encoding=utf-8

