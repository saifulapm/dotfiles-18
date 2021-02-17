" Neovim configurations - NTBBloodbath
"
"======================================="
"            Load plugins               "
"======================================="
lua require('plugins')


"======================================="
"           Load colorscheme            "
"======================================="
" Important
if has('termguicolors')
    set termguicolors
endif
" sonokai configurations
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_italic_comment = 1
let g:sonokai_current_word = 'bold'
let g:sonokai_better_performance = 1
let g:sonokai_transparent_background = 1

colorscheme sonokai


"======================================="
"              Setup LSP                "
"======================================="
lua require("lsp")
"=================="
"    nvim-compe    "
"=================="
lua require("nvim-compe")
" https://github.com/hrsh7th/nvim-compe\#mappings
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


"======================================="
"              Settings                 "
"======================================="
" nvim-toggleterm.lua
lua require("nvim-toggleterm")
" nvim-autopairs.lua
lua require("autopairs")
" tree-sitter
lua require("tree-sitter")
" lualine.nvim
lua require("lualine-nvim")

" The encoding written to file
set encoding=utf-8
" Enable your mouse, thanks god!
set mouse=a
" We don't need to see things like -- INSERT -- anymore
set noshowmode
" Show the cursor position all the time
set ruler
" set relative numbers
set number relativenumber
" So that I can see `` in markdown files
set conceallevel=0
" Stop newline continution of comments
set formatoptions-=cro
" increased for lsp code actions
set updatetime=100
" needed for nvim-compe
set completeopt=menu,menuone,preview,noselect,
" gutter space for lsp info on left
set signcolumn=yes
" use system clipboard by default
set clipboard=unnamedplus
" search recursively with :find [*]part-of-filename [tab]
set path+=**
" no swap files
set noswapfile
" no wrap file content
set nowrap
" scroll when x chars from top/bottom
set scrolloff=4
" converts tabs to spaces
set expandtab
" insert 2 spaces for a tab
set tabstop=4
" number of space characters inserted for indentation
set shiftwidth=4
" change terminal title to name of file
set title
" set spell checking language
set nospell spelllang=en_us
" automatically enter insert mode on new terminals
au TermOpen * startinsert
" improve default splitting, ctrl + w = normalize split sizes
set splitright
set splitbelow
" keep buffer window open, esp the terminal, toggle buffers without saving
set hidden
" live substitution
set inccommand=split

" highlights yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
" Save everytime cuz I'm lazy
augroup autosave
    autocmd!
    autocmd TextChanged,TextChangedI <buffer> silent! write
augroup END
" Preserve last editing position
augroup preserve_position
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END


"=================="
"    Formatting    "
"=================="
" Enable basic formatting when a filetype is not found
" Enable alignment
let g:neoformat_basic_format_align = 0
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 0
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 0
" Enabled formatters for different filetypes
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_enabled_javascript = ['prettier']
" Only message when there is an error
let g:neoformat_only_msg_on_error = 1
" Format on save
augroup formatting
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END


"========================================"
"         Custom Key Mappings            "
"                                        "
"  <leader>b  = Buffer Menu              "
"  <leader>f  = File Menu                "
"  <leader>g  = Git Menu                 "
"  <leader>p  = Plugin Menu              "
"  <leader>T  = Toggle Menu              "
"  <leader>t  = Terminal Menu            "
"  <leader>w  = Window Menu              "
"                                        "
"         TAB = Cycle buffers            "
"         ESC = Search highlighting off  "
"          F2 = Toggle Tagbar            "
"          F3 = Toggle Tree Explorer     "
"          F4 = Toggle Minimap           "
"========================================"
" Define leader key to space and call vim-leader-mapper
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
nnoremap <silent> <leader> :LeaderMapper "<Space>"<CR>
vnoremap <silent> <leader> :LeaderMapper "<Space>"<CR>

"=============="
" LeaderMapper "
"=============="
" ToggleTerm custom function to avoid having
" line numbers inside the terminal buffer
" because that is not from God.
function ToggleTerm()
    execute "ToggleTerm"
    set nonumber norelativenumber
endfunction

" Terminal menu
let termMenu = {'name': 'Terminal Menu',
            \'o': [':call ToggleTerm()', 'Open a new terminal']
            \}
" Git integration menu
let gitMenu = {'name': 'Git Menu',
            \'o': [':LazyGit',             'Open LazyGit'],
            \'P': [':TermExec git pull',   'Pull'],
            \'p': [':TermExec git push',   'Push'],
            \'s': [':TermExec git status', 'Status']
            \}
" Plugins menu
let pluginMenu = {'name': 'Plugin Menu',
            \'C': [':PackerCompile', 'Run when you make changes to your plugins'],
            \'c': [':PackerClean',   'Clean disabled or unused plugins'],
            \'i': [':PackerInstall', 'Install missing plugins'],
            \'s': [':PackerSync',  'Performs PackerClean and then PackerUpdate'],
            \'u': [':PackerUpdate',  'Update your plugins']
            \}
" Buffer order menu
let orderMenu = {'name': 'Order Buffer Menu',
            \'d': [':BufferOrderByDirectory', 'Sort by directory'],
            \'l': [':BufferOrderByLanguage',  'Sort by language'],
            \'n': [':BufferMoveNext',         'Re-order buffer to next'],
            \'p': [':BufferMovePrevious',     'Re-order buffer to previous']
            \}
" Buffer (barbar.lua) menu
let bufferMenu = {'name': 'Buffer Menu',
            \1:   [':BufferGoto 1',   'Buffer 1'],
            \2:   [':BufferGoto 2',   'Buffer 2'],
            \3:   [':BufferGoto 3',   'Buffer 3'],
            \4:   [':BufferGoto 4',   'Buffer 4'],
            \5:   [':BufferGoto 5',   'Buffer 5'],
            \6:   [':BufferGoto 6',   'Buffer 6'],
            \7:   [':BufferGoto 7',   'Buffer 7'],
            \8:   [':BufferGoto 8',   'Buffer 8'],
            \9:   [':BufferLast',     'Last buffer'],
            \'c': [':BufferClose',    'Close buffer'],
            \'n': [':BufferNext',     'Next buffer'],
            \'o': [orderMenu,         'Order buffers'],
            \'P': [':BufferPick',     'Pick buffer'],
            \'p': [':BufferPrevious', 'Previous buffer']
            \}
" File menu
let fileMenu = {'name': 'File Menu',
            \'c': [':e $MYVIMRC', 'Edit Neovim configuration'],
            \'f': [':Neoformat',  'Format the entire buffer'],
            \'n': [':new',        'Create a new unnamed buffer']
            \}
" Window menu
let windowMenu = {'name': 'Window Menu',
            \'C': [':only',   'Close all other windows'],
            \'c': [':close',  'Close current window'],
            \'h': [':split',  'Split horizontally'],
            \'v': [':vsplit', 'Split vertically']
            \}

" Toggle menu
let toggleMenu = {'name': 'Toggle Menu',
            \'m': [':MinimapToggle',               'Toggle Minimap'],
            \'n': [':set number! relativenumber!', 'Toggle Line Numbers'],
            \'s': [':Startify',                    'Open start screen'],
            \'T': [':Vista',                       'Toggle Tags view'],
            \'t': [':NvimTreeToggle',              'Toggle Tree Explorer']
            \}

" Define the main menu including the above menus
let g:leaderMenu = {'name': 'Main Menu',
            \'b': [bufferMenu, 'Buffer Menu'],
            \'f': [fileMenu,   'File Menu'],
            \'g': [gitMenu,    'Git Menu'],
            \'p': [pluginMenu, 'Plugin Menu'],
            \'T': [toggleMenu, 'Toggle Menu'],
            \'t': [termMenu,   'Terminal Menu'],
            \'w': [windowMenu, 'Window Menu']
            \}

" tab to cycle buffers too, why not?
nnoremap <silent><Tab> :bnext<CR>
nnoremap <silent><S-Tab> :bprevious<CR>

" esc to turn off search highlighting
nnoremap <silent><esc> :noh<cr>

nnoremap <F2> :Vista!!<CR>
nnoremap <F3> :NvimTreeToggle<CR>
nnoremap <F4> :MinimapToggle<CR>

"=================="
"   Disable keys   "
"=================="
" disable accidentally pressing ctrl-z and suspending
nnoremap <c-z> <Nop>

" disable recording
nnoremap q <Nop>

"==========================="
"    Setup nvim-tree.lua    "
"==========================="
let g:nvim_tree_side = 'right' " left by default
let g:nvim_tree_width = 30 " 30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '__pycache__' ] " empty by default
let g:nvim_tree_auto_open = 0 " 0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 0 " 0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 0 " 0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 " 0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 " 0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 " 0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 " 0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~'  "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 " 0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 " 0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
            \ 'git': 1,
            \ 'folders': 0,
            \ 'files': 1,
            \ }
" If 0, do not show the icons for one of 'git' 'folder' and 'files'
" 1 by default, notice that if 'files' is 1, it will only display
" if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:nvim_tree_bindings = {
            \ 'edit':            ['<CR>', 'o'],
            \ 'edit_vsplit':     '<C-v>',
            \ 'edit_split':      '<C-x>',
            \ 'edit_tab':        '<C-t>',
            \ 'close_node':      ['<S-CR>', '<BS>'],
            \ 'toggle_ignored':  'I',
            \ 'toggle_dotfiles': 'H',
            \ 'refresh':         'R',
            \ 'preview':         '<Tab>',
            \ 'cd':              '<CR>',
            \ 'create':          'n',
            \ 'remove':          'd',
            \ 'rename':          'r',
            \ 'cut':             'x',
            \ 'copy':            'c',
            \ 'paste':           'p',
            \ 'prev_git_item':   '[c',
            \ 'next_git_item':   ']c',
            \ 'dir_up':          '-',
            \ 'close':           'q',
            \ }

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
            \ 'default': '',
            \ 'symlink': '',
            \ 'git': {
            \   'unstaged': "✗",
            \   'staged': "✓",
            \   'unmerged': "",
            \   'renamed': "➜",
            \   'untracked': "★"
            \   },
            \ 'folder': {
            \   'default': "",
            \   'open': "",
            \   'symlink': "",
            \   }
            \ }

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

"==================="
"  Vista.vim setup  "
"==================="
" How each level is indented and what to prepend
" let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
" Position to open the vista sidebar only
let g:vista_sidebar_position = 'vertical topleft'
" How to show the detailed information of current cursor symbol
let g:vista_echo_cursor_strategy = 'both'
" Close the vista window automati when you jump to a symbol
let g:vista_close_on_jump = 1
" Executive used when opening vista sidebar without specifying it
let g:vista_default_executive = 'nvim_lsp'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
            \ "function": "\uf794",
            \ "variable": "\uf71b",
            \ }

"=================="
"  Startify Setup  "
"=================="
" Startify list
let g:startify_lists = [
            \ { 'type': 'dir',      'header': ['    Most Recently Used files in the current directory:'] },
            \ { 'type': 'files',    'header': ['    Most Recently Used:'] }
            \ ]
" The number of files to list
let g:startify_files_number = 10
" A list of Vim regular expressions that is used to filter recently used files
let g:startify_skiplist = [
            \ 'runtime/doc/.*\.txt$',
            \ 'bundle/.*/doc/.*\.txt$',
            \ 'plugged/.*/doc/.*\.txt$',
            \ '/.git/',
            \ '/node_modules/',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc/.*\.txt$'
            \]
" Using this option updates v:oldfiles on-the-fly, so that :Startify is always up-to-date
let g:startify_update_oldfiles = 1
" When opening a file or bookmark, change to its directory
let g:startify_change_to_dir = 1
" The default command for switching directories
let g:startify_change_cmd = 'lcd'
" Custom header
let g:startify_custom_header = [
            \ '     ███▄    █▄▄▄█████▓▄▄▄▄   ▄▄▄▄   ██▓    ▒█████  ▒█████ ▓█████▄ ▄▄▄▄   ▄▄▄    ▄▄▄█████▓██░ ██     ',
            \ '     ██ ▀█   █▓  ██▒ ▓▓█████▄▓█████▄▓██▒   ▒██▒  ██▒██▒  ██▒██▀ ██▓█████▄▒████▄  ▓  ██▒ ▓▓██░ ██▒    ',
            \ '    ▓██  ▀█ ██▒ ▓██░ ▒▒██▒ ▄█▒██▒ ▄█▒██░   ▒██░  ██▒██░  ██░██   █▒██▒ ▄█▒██  ▀█▄▒ ▓██░ ▒▒██▀▀██░    ',
            \ '    ▓██▒  ▐▌██░ ▓██▓ ░▒██░█▀ ▒██░█▀ ▒██░   ▒██   ██▒██   ██░▓█▄   ▒██░█▀ ░██▄▄▄▄█░ ▓██▓ ░░▓█ ░██     ',
            \ '    ▒██░   ▓██░ ▒██▒ ░░▓█  ▀█░▓█  ▀█░██████░ ████▓▒░ ████▓▒░▒████▓░▓█  ▀█▓▓█   ▓██▒▒██▒ ░░▓█▒░██▓    ',
            \ '    ░ ▒░   ▒ ▒  ▒ ░░  ░▒▓███▀░▒▓███▀░ ▒░▓  ░ ▒░▒░▒░░ ▒░▒░▒░ ▒▒▓  ▒░▒▓███▀▒▒▒   ▓▒█░▒ ░░   ▒ ░░▒░▒    ',
            \ '    ░ ░░   ░ ▒░   ░   ▒░▒   ░▒░▒   ░░ ░ ▒  ░ ░ ▒ ▒░  ░ ▒ ▒░ ░ ▒  ▒▒░▒   ░  ▒   ▒▒ ░  ░    ▒ ░▒░ ░    ',
            \ '       ░   ░ ░  ░      ░    ░ ░    ░  ░ ░  ░ ░ ░ ▒ ░ ░ ░ ▒  ░ ░  ░ ░    ░  ░   ▒   ░      ░  ░░ ░    ',
            \ '             ░         ░      ░         ░  ░   ░ ░     ░ ░    ░    ░           ░  ░       ░  ░  ░    ',
            \ '                            ░      ░                        ░           ░                            ',
            \ '                                                                                                     ',
            \ '                                                                                                     ',
            \ '                    "Solve the problem and then write the code" - GitHub : NTBBloodbath              '
            \ ]
