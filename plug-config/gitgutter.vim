let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_removed            = '契'
let g:gitgutter_sign_removed_first_line = '契'
let g:gitgutter_sign_modified_removed   = '▎'
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_terminal_reports_focus=1

set updatetime=250
let g:gitgutter_enabled = 1

highlight GitGutterAdd    guifg=#A3BE8C ctermfg=2
highlight GitGutterChange guifg=#5E81AC ctermfg=3
highlight GitGutterDelete guifg=#BF616A ctermfg=1
