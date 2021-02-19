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
let g:sonokai_transparent_background = 0

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
" galaxyline.nvim
lua require("galaxyline-nvim")
" focus.nvim
lua require("focus-nvim")

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

" See https://github.com/spinks/vim-leader-guide#recommended
" to know why we are mapping like this
" Define prefix dictionary
let g:lmap = {}
"==================="
"   Terminal menu   "
"==================="
let g:lmap.T = {'name': 'Terminal Menu'}
nnoremap <leader>To :call ToggleTerm()<CR>
let g:lmap.T.o = 'Open a new terminal'
"==============="
"    Git menu   "
"==============="
let g:lmap.g = {'name': 'Git Menu'}
nnoremap <leader>go :LazyGit<CR>
let g:lmap.g.o = 'Open LazyGit'
nnoremap <leader>gP :TermExec git pull<CR>
let g:lmap.g.P = 'Pull'
nnoremap <leader>gp :TermExec git push<CR>
let g:lmap.g.p = 'Push'
nnoremap <leader>gs :TermExec git status<CR>
let g:lmap.g.s = 'Status'
"=================="
"   Plugins menu   "
"=================="
let g:lmap.p = {'name': 'Plugin Menu'}
nnoremap <leader>pC :PackerCompile<CR>
let g:lmap.p.C = 'Run when you make changes to your plugins'
nnoremap <leader>pc :PackerClean<CR>
let g:lmap.p.c = 'Clean disabled or unused plugins'
nnoremap <leader>pi :PackerInstall<CR>
let g:lmap.p.i = 'Install missing plugins'
nnoremap <leader>ps :PackerSync<CR>
let g:lmap.p.s = 'Performs PackerClean and then PackerUpdate'
nnoremap <leader>pu :PackerUpdate<CR>
let g:lmap.p.u = 'Update your plugins'
"================="
"   Buffer menu   "
"================="
let g:lmap.b = {'name': 'Buffer Menu'}
nnoremap <leader>b1 :BufferGoto 1<CR>
let g:lmap.b.1 = 'Buffer 1'
nnoremap <leader>b2 :BufferGoto 2<CR>
let g:lmap.b.2 = 'Buffer 2'
nnoremap <leader>b3 :BufferGoto 3<CR>
let g:lmap.b.3 = 'Buffer 3'
nnoremap <leader>b4 :BufferGoto 4<CR>
let g:lmap.b.4 = 'Buffer 4'
nnoremap <leader>b5 :BufferGoto 5<CR>
let g:lmap.b.5 = 'Buffer 5'
nnoremap <leader>b6 :BufferGoto 6<CR>
let g:lmap.b.6 = 'Buffer 6'
nnoremap <leader>b7 :BufferGoto 7<CR>
let g:lmap.b.7 = 'Buffer 7'
nnoremap <leader>b8 :BufferGoto 8<CR>
let g:lmap.b.8 = 'Buffer 8'
nnoremap <leader>b9 :BufferLast<CR>
let g:lmap.b.9 = 'Last buffer'
nnoremap <leader>bc :BufferClose<CR>
let g:lmap.b.c = 'Close buffer'
nnoremap <leader>bf :Neoformat<CR>
let g:lmap.b.f = 'Format buffer'
nnoremap <leader>bn :BufferNext<CR>
let g:lmap.b.n = 'Next buffer'
nnoremap <leader>bP :BufferPick<CR>
let g:lmap.b.P = 'Pick buffer'
nnoremap <leader>bp :BufferPrevious<CR>
let g:lmap.b.p = 'Previous buffer'
"==================="
" Buffer order menu "
"==================="
let g:lmap.o = {'name': 'Order Buffer Menu'}
nnoremap <leader>od :BufferOrderByDirectory<CR>
let g:lmap.o.d = 'Sort by directory'
nnoremap <leader>ol :BufferOrderByLanguage<CR>
let g:lmap.o.l = 'Sort by language'
nnoremap <leader>on :BufferMoveNext<CR>
let g:lmap.o.n = 'Re-order buffer to next'
nnoremap <leader>op :BufferMovePrevious<CR>
let g:lmap.o.p = 'Re-order buffer to previous'
"==============="
"   File menu   "
"==============="
let g:lmap.f = {'name': 'File Menu'}
nnoremap <leader>fb :Telescope marks<CR>
let g:lmap.f.b = 'Bookmarks'
nnoremap <leader>fc :e $MYVIMRC<CR>
let g:lmap.f.c = 'Edit Neovim configuration'
nnoremap <leader>ff :Telescope find_files<CR>
let g:lmap.f.f = 'Find file'
nnoremap <leader>fg :Telescope live_grep<CR>
let g:lmap.f.g = 'Find word'
" Override existing telescope <leader>fh mapping
autocmd VimEnter * noremap <leader>fh :Telescope oldfiles<CR>
" nnoremap <leader>fh :call Telescope oldfiles<CR>
let g:lmap.f.h = 'Recently opened files'
nnoremap <leader>fn :new<CR>
let g:lmap.f.n = 'Create a new unnamed buffer'
"================="
"   Window menu   "
"================="
let g:lmap.w = {'name': 'Window Menu'}
nnoremap <leader>wC :only<CR>
let g:lmap.w.C = 'Close all other windows'
nnoremap <leader>wc :close<CR>
let g:lmap.w.c = 'Close current window'
nnoremap <leader>wh :split<CR>
let g:lmap.w.h = 'Split horizontally'
nnoremap <leader>wv :vsplit<CR>
let g:lmap.w.v = 'Split vertically'
"================="
"   Toggle menu   "
"================="
let g:lmap.t = {'name': 'Toggle Menu'}
nnoremap <leader>tc :Telescope colorscheme<CR>
let g:lmap.t.c = 'Change colorscheme'
nnoremap <leader>tm :MinimapToggle<CR>
let g:lmap.t.m = 'Toggle Minimap'
nnoremap <leader>tn :set number! relativenumber!<CR>
let g:lmap.t.n = 'Toggle Line Numbers'
nnoremap <leader>ts :Dashboard<CR>
let g:lmap.t.s = 'Open start screen'
nnoremap <leader>tT :Vista!!<CR>
let g:lmap.t.T = 'Toggle Tags view'
nnoremap <leader>tt :NvimTreeToggle<CR>
let g:lmap.t.t = 'Toggle Tree Explorer'
" Register the dictionary
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

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

"======================"
"  nvim-colorizer.lua  "
"======================"
lua require('nvim-colorizer')

"=================="
"  Telescope.nvim  "
"=================="
lua require('telescope-nvim')
" Find files using Telescope command-line sugar using lua functions.
" https://github.com/nvim-telescope/telescope.nvim#usage
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"========================"
"  Dashboard-nvim Setup  "
"========================"
" Default fuzzy search plugin
let g:dashboard_default_executive = 'telescope'
" Get neovim version
let nvim_version = matchstr(execute('version'), 'v\zs[^\n]*')
" Custom header taken from https://github.com/btwiusegentoo dotfiles
let g:dashboard_custom_header = [
            \ "",
            \ "       ▄▄        ▄▄ ",
            \ "     ▄████       ███▄                                            ▄▄ ",
            \ "   ▄ ▀█████▄     █████                                           ▀▀ ",
            \ "   ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄ ",
            \ "   ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██ ",
            \ "   ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██ ",
            \ "   ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██ ",
            \ "   ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀ ",
            \ "   ▀   ▐      ▀█████ █ ",
            \ "     ▀▄▐       ▀████ ",
            \ "       ▀         ▀ ",
            \ "",
            \ "                                                             version: ". nvim_version ."",
            \ "",
            \ "",
            \ "",
            \ "",
            \ "",
            \ ]
" Custom footer
" See how much plugins are there
let plugins_dir = globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
let plugins_count = len(plugins_dir)
let g:dashboard_custom_footer = ["Neovim loaded ". plugins_count ." plugins"]
" headercolor
hi! dashboardHeader guifg=#c3e88d
hi! dashboardCenter guifg=#89ddff
hi! dashboardShortcut guifg=#c792ea
hi! dashboardFooter guifg=#676E95
