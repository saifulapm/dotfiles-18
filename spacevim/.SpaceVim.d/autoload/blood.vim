function! blood#before() abort
  " Enable vim-airline to use sonokai statusline theme.
  call SpaceVim#layers#disable('core#statusline')
  call SpaceVim#layers#disable('core#tabline')

  " Sonokai theme
  let g:sonokai_style = 'andromeda'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 1

  " Airline setup
  let g:airline_powerline_fonts = 1
endfunction

function! blood#after() abort
  " Defx setup
  call defx#custom#option('_', {
        \ 'columns': 'mark:indent:icons:filename:type',
        \ 'winwidth': 40,
        \ 'split': 'vertical',
        \ 'show_ignored_files': 0,
        \ 'ignored_files': '*.pyc,*.pyd,*~,*.swo,*.swp,.git,.hg,.svn,.bzr,.DS_Store',
        \ })

  call defx#custom#column('mark', {
        \ 'readonly_icon': '',
        \ 'selected_icon': '✓',
        \ })

  call defx#custom#column('filename', {
        \ 'min_width': 5,
        \ 'max_width': 25,
        \ })

  call defx#custom#column('time', {
        \ 'format': '%Y %b %e %H:%M:%S',
        \ })

  " Defx icons setup
  let g:defx_icons_enable_syntax_highlight = 1
  let g:defx_icons_column_length = 1
  let g:defx_icons_directory_icon = ''
  let g:defx_icons_mark_icon = '*'
  let g:defx_icons_copy_icon = ''
  let g:defx_icons_move_icon = ''
  let g:defx_icons_parent_icon = ''
  let g:defx_icons_default_icon = ''
  let g:defx_icons_directory_symlink_icon = ''
  " Options below are applicable only when using "tree" feature
  let g:defx_icons_root_opened_tree_icon = ''
  let g:defx_icons_nested_opened_tree_icon = ''
  let g:defx_icons_nested_closed_tree_icon = ''

  " Defx keymaps
  function! s:defx_keymaps() abort
    " double click/Enter/l to open file
    nnoremap <silent><buffer><expr> <2-LeftMouse> <sid>defx_toggle_tree_or_open_file()
    nnoremap <silent><buffer><expr> <CR> <sid>defx_toggle_tree_or_open_file()
    nnoremap <silent><buffer><expr> l    <sid>defx_cd_or_open_file()

    nnoremap <silent><buffer><expr> q     defx#do_action('quit')
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
    nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])

    nnoremap <silent><buffer><expr><nowait> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> <C-c>  defx#do_action('clear_select_all')
    nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

    nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> dd    defx#do_action('remove')
    nnoremap <silent><buffer><expr> r     defx#do_action('rename')
    nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
    nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
    nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
    nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')

    nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')
  endfunction
endfunction
