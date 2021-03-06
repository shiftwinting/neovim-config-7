if !exists('g:vscode')
	let mapleader = " "
endif
" plugins

call plug#begin()
    Plug 'tpope/vim-commentary'
    Plug 'asvetliakov/vim-easymotion'
    Plug 'tpope/vim-surround'
    if exists('g:vscode')
	    Plug 'asvetliakov/vim-easymotion', { 'as': 'vsc-easymotion' }
    else
	    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	    " htatus line 
	    Plug 'itchyny/lightline.vim'
	    Plug 'pablobender/lightline-gruvbox.vim'
	    Plug 'itchyny/vim-gitbranch'
	    Plug 'sheerun/vim-polyglot'
	    Plug 'airblade/vim-gitgutter'
	    Plug 'tpope/vim-fugitive'
	    Plug 'mhinz/vim-startify'
	    Plug 'vim-airline/vim-airline-themes'
	    Plug 'junegunn/fzf' 
	    Plug 'junegunn/fzf.vim'
	    Plug 'stsewd/fzf-checkout.vim'
	    Plug 'airblade/vim-rooter'
	    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
	    Plug 'majutsushi/tagbar'
	    Plug 'plasticboy/vim-markdown'
	    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
	    Plug 'norcalli/nvim-colorizer.lua'
	    Plug 'arcticicestudio/nord-vim'
	    " Plug 'easymotion/vim-easymotion'
	    " themes
	    Plug 'franbach/miramare'
	    Plug 'drewtempelmeyer/palenight.vim'
	    Plug  'arzg/vim-colors-xcode'
	    Plug 'caenrique/nvim-toggle-terminal'
	    Plug 'vim-scripts/netrw.vim'
	    Plug 'puremourning/vimspector'
	    Plug 'joshdick/onedark.vim'
	    Plug 'hallzy/lightline-'
    endif
call plug#end()
source $HOME/.config/nvim/plug-config/commentary.vim
if (has("termguicolors"))
  set termguicolors
endif
if exists('g:vscode')
	source $HOME/.config/nvim/plug-config/settings.vim
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine

else
	source $HOME/.config/nvim/plug-config/polyglot.vim
	source $HOME/.config/nvim/plug-config/toggle-term.vim
	source $HOME/.config/nvim/plug-config/lightline.vim
	source $HOME/.config/nvim/plug-config/signify.vim
	source $HOME/.config/nvim/plug-config/start-screen.vim
	source $HOME/.config/nvim/plug-config/polyglot.vim
	source $HOME/.config/nvim/plug-config/coc.vim
	source $HOME/.config/nvim/plug-config/fzf.vim
	source $HOME/.config/nvim/plug-config/rnvimr.vim
	" setup lua
	lua require'colorizer'.setup()
	" theming 
	set number relativenumber

	set background=dark
	colorscheme nord
	if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 <
	" https://github.com/neovim/neovim/pull/2198 >

		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif


	" tags 
	nmap <F8> :TagbarToggle<CR>
endif



" enable mouse support
set mouse=a
" highlight line and column
set cursorline
set cursorcolumn
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
set colorcolumn=120
let g:mkdp_browser = 'chromium'
