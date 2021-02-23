--[[------------------------]]--
--   Plugins initialization
--]]------------------------[[--

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
---[[------------]]---
--    Essentials    --
---]]------------[[---
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }
    -- Auxiliar functions
    use 'svermeulen/vimpeccable'
---[[--------]]---
--      UI      --
---]]--------[[---
    -- Fancy start screen
    use 'glepnir/dashboard-nvim'
    -- Colorschemes
    use {
        'sainnhe/sonokai',
        'wadackel/vim-dogrun'
    }
    -- File tree, don't use the latest commit 'cause it's broken, at least for me
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        commit = '0136801444cfb2d85ae956d8c23c79f4a9f26b90'
    }
    -- Statusline
    use {
        'datwaft/bubbly.nvim',
        config = require('statusline')
    }
    -- Tabline
    use 'romgrk/barbar.nvim'
    -- Better quickfix window
    use 'kevinhwang91/nvim-bqf'
    -- Better splits
    -- NOTE: we are using this specific branch 'cause the main still doesn't have
    -- the ignore filetypes feature, thanks to its owner per adding it :)
    use {
        'beauwilliams/focus.nvim',
        branch = 'cust_filetypes',
        config = require('focus-nvim')
    }
    -- Better terminal
    use {
        'akinsho/nvim-toggleterm.lua',
        config = require('nvim-toggleterm')
    }
    -- Viewer & finder for LSP symbols and tags
    use 'liuchengxu/vista.vim'
    -- Minimap, requires wfxr/code-minimap
    use 'wfxr/minimap.vim'
    -- Keybindings menu like SpaceVim
    use 'spinks/vim-leader-guide'

---[[--------------]]---
--    Fuzzy Search    --
---]]--------------[[---
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}
        },
        config = require('telescope-nvim')
    }

---[[------------------]]---
--    Git integrations    --
---]]------------------[[---
    -- Git gutter alternative
    use 'mhinz/vim-signify'
    -- LazyGit integration
    use 'kdheepak/lazygit.nvim'

---[[------------]]---
--    Completion    --
---]]------------[[---
    -- Built-in LSP Config
    use {
        'neovim/nvim-lspconfig',
        config = require('lsp')
    }
    -- Completion plugin
    use {
        'hrsh7th/nvim-compe',
        config = require('nvim-compe')
    }

---[[--------------]]---
--    File-related    --
---]]--------------[[---
    -- Write files without write permissions (e.g. /etc files)
    -- This 'cause I don't want to clone my Neovim configs to the root user.
    -- NOTE: It will use your current user password, not the root password.
    use 'lambdalisue/suda.vim'
    -- File formatting
    use 'sbdchd/neoformat'
    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = require('autopairs')
    }
    -- Code runner. Run install.sh as a post-installation script,
    -- it will download or compile the sniprun binary.
    use { 'michaelb/sniprun', run = 'bash install.sh' }
    -- EditorConfig support
    use 'editorconfig/editorconfig-vim'

---[[----------]]---
--      Misc      --
---]]----------[[---
    -- Discord RPC
    use 'andweeb/presence.nvim'
    -- Snippets
    use 'hrsh7th/vim-vsnip'

---[[-------------]]---
--    Tree-sitter    --
---]]-------------[[---
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('tree-sitter')
    }

---[[----------]]---
--    Comments    --
---]]----------[[---
    use 'b3nj5m1n/kommentary'

---[[-------------]]---
--    Web-related    --
---]]-------------[[---
    -- Fastest colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        config = require('nvim-colorizer')
    }
    -- HTTP Client support, requires
    -- https://github.com/bayne/dot-http
    use 'bayne/vim-dot-http'
    -- Markdown previewer
    use { 'iamcco/markdown-preview.nvim', run = 'cp app && yarn install' }
end)
