" TODO find way to add doc abilities back for compe
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- scroll down hover doc or scroll in definition preview
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" signature
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
nnoremap <silent>rn :Lspsaga rename<CR>

highlight LspSagaBorderTitle guifg=#88C0D0
highlight LspSagaRenameBorder guifg=#88C0D0
highlight LspSagaHoverBorder guifg=#88C0D0
highlight LspSagaSignatureHelpBorder guifg=#88C0D0
highlight LspSagaCodeActionBorder guifg=#88C0D0	
highlight LspSagaAutoPreview guifg=#88C0D0
highlight LspSagaDefPreviewBorder guifg=#88C0D0	
highlight LspSagaDiagnosticBorder guifg=#88C0D0
highlight LspFloatWinBorder guifg=#88C0D0
highlight LspSagaDiagnosticTruncateLine guifg=#88C0D0
