let mapleader = " "
" plugins
call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " status line 
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf' 
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'majutsushi/tagbar'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'easymotion/vim-easymotion'
    " themes
    Plug 'franbach/miramare'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug  'arzg/vim-colors-xcode'
call plug#end()

source $HOME/.config/nvim/plug-config/commentary.vim
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/polyglot.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/polyglot.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim

" theming 
set number relativenumber
set background=dark
colorscheme gruvbox
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 <
" https://github.com/neovim/neovim/pull/2198 >

	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" tags 
nmap <F8> :TagbarToggle<CR>

" setup lua
lua require'colorizer'.setup()

" enable mouse support
set mouse=a
