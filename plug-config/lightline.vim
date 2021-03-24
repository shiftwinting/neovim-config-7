let g:lightline = {
	\'mode_map' : {
	    \ 'n' : 'N',
	    \ 'i' : 'I',
	    \ 'R' : 'R',
	    \ 'v' : 'V',
	    \ 'V' : 'V-L',
	    \ "\<C-v>": 'V-B',
	    \ 'c' : 'COMMAND',
	    \ 's' : 'SELECT',
	    \ 'S' : 'S-LINE',
	    \ "\<C-s>": 'S-BLOCK',
	    \ 't': 'TERMINAL',
	    \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch'],['virtualenv', 'readonly', 'filename'], [ 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            ['fileencoding'] ]},
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'venv': 'virtualenv#statusline',
      \   'filename':'LightlineFilename',
      \ },
      \ }
let g:lightline.colorscheme = 'nord'
let g:lightline.separator = {'left': "\ue0b4", 'right':"\uE0b6"}

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
