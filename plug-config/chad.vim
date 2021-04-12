nnoremap <leader>e <cmd>CHADopen<cr>

let g:chadtree_settings = {
          \ 'options.show_hidden': v:true,
          \ 'view.sort_by': ["is_folder", "file_name", "ext"],
          \ 'theme.text_colour_set': 'env',
          \ 'options.version_control.enable': v:true,
          \ }
