nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For => ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>

" highlight
highlight TelescopeSelection      guifg=#EBCB8B gui=bold " selected item
highlight TelescopeSelectionCaret guifg=#B48EAD " selection caret
highlight TelescopeMultiSelection guifg=#928374 " multisections

highlight TelescopeBorder         guifg=#88C0D0 ctermfg=10
highlight TelescopePromptBorder   guifg=#88C0D0
highlight TelescopeResultsBorder  guifg=#88C0D0
highlight TelescopePreviewBorder  guifg=#88C0D0
