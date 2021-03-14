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
	    " htatus line 
	    Plug 'itchyny/lightline.vim'
	    Plug 'itchyny/vim-gitbranch'
	    Plug 'airblade/vim-gitgutter'
	    Plug 'tpope/vim-fugitive'
	    Plug 'mhinz/vim-startify'
	    Plug 'airblade/vim-rooter'
	    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
	    Plug 'majutsushi/tagbar'
	    Plug 'plasticboy/vim-markdown'
	    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
	    Plug 'norcalli/nvim-colorizer.lua'
	    " Plug 'easymotion/vim-easymotion'
	    Plug 'caenrique/nvim-toggle-terminal'
	    Plug 'vim-scripts/netrw.vim'
	    Plug 'puremourning/vimspector'
	    Plug 'christianchiarulli/nvcode-color-schemes.vim'
	    Plug 'nvim-treesitter/nvim-treesitter'
	    Plug 'unblevable/quick-scope'       " Plug
	    Plug 'justinmk/vim-sneak'
      " file explorer
      " requires 
      Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
      " lsp
      Plug 'neovim/nvim-lspconfig'
      Plug 'hrsh7th/nvim-compe'
      Plug 'anott03/nvim-lspinstall'
      Plug 'glepnir/lspsaga.nvim'
      Plug 'onsails/lspkind-nvim'
      Plug 'alvan/vim-closetag'
      Plug 'jiangmiao/auto-pairs'
      " try alternative file explorer
      Plug 'kyazdani42/nvim-web-devicons' " for file icons
      " Plug 'kyazdani42/nvim-tree.lua'
      " telescope requirements...
      Plug 'nvim-lua/popup.nvim'
      Plug 'nvim-lua/plenary.nvim'
      Plug 'nvim-telescope/telescope.nvim'
      Plug 'nvim-telescope/telescope-fzy-native.nvim'
      Plug 'airblade/vim-rooter'
      Plug 'p00f/nvim-ts-rainbow'
      " prettier
      Plug 'neoclide/coc.nvim', {'branch': 'release'}
      Plug 'knubie/vim-kitty-navigator'
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
	source $HOME/.config/nvim/plug-config/toggle-term.vim
	source $HOME/.config/nvim/plug-config/lightline.vim
	source $HOME/.config/nvim/plug-config/start-screen.vim
	source $HOME/.config/nvim/plug-config/rnvimr.vim
	source $HOME/.config/nvim/plug-config/tree-sitter-colorschemes.vim
	source $HOME/.config/nvim/plug-config/sneak.vim
	source $HOME/.config/nvim/plug-config/chad.vim
	source $HOME/.config/nvim/plug-config/gitgutter.vim
	source $HOME/.config/nvim/plug-config/closetags.vim
	" source $HOME/.config/nvim/lua/lsp.lua
	source $HOME/.config/nvim/plug-config/lsp.vim
	source $HOME/.config/nvim/plug-config/lsp-saga.vim
  luafile $HOME/.config/nvim/lua/lsp.lua
	luafile $HOME/.config/nvim/lua/compe-config.lua
	luafile $HOME/.config/nvim/lua/lsp-saga.lua
	luafile $HOME/.config/nvim/lua/lsp-kind.lua
	luafile $HOME/.config/nvim/telescope.lua
	source $HOME/.config/nvim/plug-config/telescope.vim

	" setup lua
	lua require'colorizer'.setup()
	" theming 
	set number relativenumber

	set background=dark
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
set cmdheight=1

" Identation
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Trigger a highlight in the appropriate direction when pressing these key:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

lua << EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true
  }
}
EOF


let g:kitty_navigator_no_mappings = 1
set title
let &titlestring='%t - nvim'

nnoremap <silent> <c-h> :KittyNavigateLeft<cr>
nnoremap <silent> <c-j> :KittyNavigateDown<cr>
nnoremap <silent> <c-k> :KittyNavigateUp<cr>
nnoremap <silent> <c-l> :KittyNavigateRight<cr>
