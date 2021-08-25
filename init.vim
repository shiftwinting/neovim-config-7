if !exists('g:vscode')
	" luafile $HOME/.config/nvim/lua/git-signs.lua
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
      Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
	    Plug 'itchyny/vim-gitbranch'
	    Plug 'tpope/vim-fugitive'
	    Plug 'mhinz/vim-startify'
	    Plug 'airblade/vim-rooter'
	    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
	    Plug 'plasticboy/vim-markdown'
	    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
	    Plug 'norcalli/nvim-colorizer.lua'
	    " Plug 'easymotion/vim-easymotion'
	    Plug 'caenrique/nvim-toggle-terminal'
	    Plug 'puremourning/vimspector'
	    Plug 'christianchiarulli/nvcode-color-schemes.vim'
	    Plug 'nvim-treesitter/nvim-treesitter'
	    Plug 'unblevable/quick-scope'       " Plug
	    Plug 'justinmk/vim-sneak'
      " file explorer
      " requires 
      " lsp
      Plug 'neovim/nvim-lspconfig'
      Plug 'hrsh7th/nvim-compe'
      Plug 'kabouzeid/nvim-lspinstall'
      Plug 'glepnir/lspsaga.nvim'
      Plug 'onsails/lspkind-nvim'
      Plug 'alvan/vim-closetag'
      Plug 'jiangmiao/auto-pairs'
      Plug 'kyazdani42/nvim-web-devicons' " for file icons
      " telescope requirements...
      Plug 'nvim-lua/popup.nvim'
      Plug 'nvim-lua/plenary.nvim'
      Plug 'nvim-telescope/telescope.nvim'
      Plug 'nvim-telescope/telescope-fzy-native.nvim'
      Plug 'airblade/vim-rooter'
      Plug 'p00f/nvim-ts-rainbow'
      " prettier
      Plug 'knubie/vim-kitty-navigator'
      " tag
      Plug 'AndrewRadev/tagalong.vim'
      Plug 'sainnhe/gruvbox-material'
      Plug 'simrat39/symbols-outline.nvim'
      " lsp utils
      Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
      " show tags in lsp
      Plug 'APZelos/blamer.nvim'
      Plug 'kyazdani42/nvim-tree.lua'
      Plug 'akinsho/nvim-bufferline.lua'
      Plug 'tpope/vim-abolish'
      Plug 'sindrets/diffview.nvim'
      Plug 'svermeulen/vimpeccable'
      Plug 'mlaursen/vim-react-snippets'
      Plug 'vimwiki/vimwiki'
      Plug 'folke/tokyonight.nvim'
      Plug 'xolox/vim-notes'
      Plug 'xolox/vim-misc'
      " notes
      Plug 'oberblastmeister/neuron.nvim'
      Plug 'nvim-lua/popup.nvim'
      Plug 'ahmedkhalf/lsp-rooter.nvim'
      " Plug 'vhyrro/neorg'
      " Plug 'kristijanhusak/orgmode.nvim'
      Plug 'Shougo/neosnippet.vim'
      Plug 'himkt/docstring.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'Shougo/neosnippet-snippets'
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
	source $HOME/.config/nvim/plug-config/start-screen.vim
	source $HOME/.config/nvim/plug-config/rnvimr.vim
	source $HOME/.config/nvim/plug-config/tree-sitter-colorschemes.vim
	source $HOME/.config/nvim/plug-config/signify.vim
	source $HOME/.config/nvim/plug-config/sneak.vim
	source $HOME/.config/nvim/plug-config/nvim-tree.vim
	source $HOME/.config/nvim/plug-config/closetags.vim
	source $HOME/.config/nvim/plug-config/lsp.vim
  luafile $HOME/.config/nvim/lua/lsp_conf.lua
	luafile $HOME/.config/nvim/lua/lsp-saga.lua
	luafile $HOME/.config/nvim/lua/lsp-kind.lua
	luafile $HOME/.config/nvim/lua/statusline.lua
	luafile $HOME/.config/nvim/telescope.lua
	luafile $HOME/.config/nvim/lua/nvim-bufferline.lua
	luafile $HOME/.config/nvim/lua/git-diff.lua
	luafile $HOME/.config/nvim/lua/symbols.lua
	luafile $HOME/.config/nvim/lua/plug-colorizer.lua
	luafile $HOME/.config/nvim/lua/compe-config.lua

	" theming 
	set number relativenumber
  set hidden
	set background=dark
	if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 <
	" https://github.com/neovim/neovim/pull/2198 >

		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
  let g:kitty_navigator_no_mappings = 1
  set title
  let &titlestring='%t - nvim'

  nnoremap <silent> <c-h> :KittyNavigateLeft<cr>
  nnoremap <silent> <c-j> :KittyNavigateDown<cr>
  nnoremap <silent> <c-k> :KittyNavigateUp<cr>
  nnoremap <silent> <c-l> :KittyNavigateRight<cr>
  " Window Management
  nnoremap <silent> <leader>s :split<cr>
  nnoremap <silent> <leader>v :vsplit<cr>
  " a list of groups can be found at `:help nvim_tree_highlight`
  highlight NvimTreeFolderIcon guifg=#2ac3de
  inoremap <silent><expr> <C-Space> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" enable mouse support
  "
  set mouse=a
  " highlight line and column
  " set cursorline
  set noshowmode
  " set colorcolumn=120
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
  source $HOME/.config/nvim/plug-config/lsp-saga.vim
  source $HOME/.config/nvim/plug-config/telescope.vim

endif
lua << EOF
  require'nvim-treesitter.configs'.setup {
}
EOF




