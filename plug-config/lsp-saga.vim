" TODO find way to add doc abilities back for compe
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- scroll down hover doc or scroll in definition preview
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" signature
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>

" highlight LspSagaBorderTitle guifg=#ddc7a1
" highlight LspSagaRenameBorder guifg=#ddc7a1
" highlight LspSagaHoverBorder guifg=#ddc7a1
" highlight LspSagaSignatureHelpBorder guifg=#ddc7a1
" highlight LspSagaCodeActionBorder guifg=#ddc7a1	
" highlight LspSagaAutoPreview guifg=#ddc7a1
" highlight LspSagaDefPreviewBorder guifg=#ddc7a1	
" highlight LspSagaDiagnosticBorder guifg=#ddc7a1
" highlight LspFloatWinBorder guifg=#ddc7a1
" highlight LspSagaDiagnosticTruncateLine guifg=#ddcC
