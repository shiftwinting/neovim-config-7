nnoremap <leader>ps :lua require('telescope.builtin').live_grep()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>fs :lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <leader>fS :lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>
nnoremap <leader>pp :Telescope projects<CR>


nnoremap <leader>gs :SymbolsOutline<CR>
