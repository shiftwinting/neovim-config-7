" configure treesitter

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
lua << EOF
vim.g.tokyonight_style = "storm"
EOF
set nocompatible
filetype plugin on
colorscheme tokyonight " Or whatever colorscheme you make
let ayucolor="mirage" " for mirage version of themeS
" set background=light

" let g:everforest_background = 'hard'
" let g:everforest_enable_italic = 1

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    " enable for transparency
    " hi Normal guibg=none ctermbg=none
    " hi LineNr guibg=none ctermbg=none
    " hi Folded guibg=none ctermbg=none
    " hi NonText guibg=none ctermbg=none
    " hi SpecialKey guibg=none ctermbg=none
    " hi VertSplit guibg=none ctermbg=none
    " hi SignColumn guibg=none ctermbg=none
    " hi EndOfBuffer guibg=none ctermbg=none
endif
