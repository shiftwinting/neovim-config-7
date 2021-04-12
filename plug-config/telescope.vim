nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For => ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>

" highlight
highlight TelescopeSelection      guifg=#d8a657 gui=bold " selected item
highlight TelescopeSelectionCaret guifg=#d3869b " selection caret
highlight TelescopeMultiSelection guifg=#928374 " multisections

highlight TelescopeBorder         guifg=#ddc7a1 ctermfg=10
highlight TelescopePromptBorder   guifg=#ddc7a1
highlight TelescopeResultsBorder  guifg=#ddc7a1
highlight TelescopePreviewBorder  guifg=#ddc7a1
