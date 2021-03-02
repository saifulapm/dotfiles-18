--[[------------------------]]--
--   Plugins initialization   --
--]]------------------------[[--

vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function()
---[[------------]]---
--    Essentials    --
---]]------------[[---
    -- Plugins manager
    use {
        'wbthomason/packer.nvim',
        opt = true
    }
    -- Auxiliar functions
    use 'svermeulen/vimpeccable'
---[[--------]]---
--      UI      --
---]]--------[[---
    -- Fancy start screen
    use {
        'glepnir/dashboard-nvim',
        config = require('plugins.dashboard')
    }
    -- Colorschemes
    use {
        'sainnhe/sonokai',
        'wadackel/vim-dogrun',
        'ghifarit53/tokyonight-vim'
    }
    -- File tree, don't use the latest commit 'cause it's broken, at least for me
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        commit = '491fd68d62cebd4a07642cc052028d9d3b55f62e',
        config = require('plugins.nvim-tree')
    }
    -- Statusline
    use {
        'datwaft/bubbly.nvim',
        config = require('plugins.statusline')
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
        config = require('plugins.focus-nvim')
    }
    -- Better terminal
    use {
        'akinsho/nvim-toggleterm.lua',
        config = require('plugins.nvim-toggleterm')
    }
    -- Viewer & finder for LSP symbols and tags
    use {
        'liuchengxu/vista.vim',
        config = require('plugins.vista')
    }
    -- Minimap, requires wfxr/code-minimap
    use 'wfxr/minimap.vim'
    -- Keybindings menu like SpaceVim
    use {
        'spinks/vim-leader-guide',
        config = require("plugins.leader-mapper")
    }

---[[--------------]]---
--    Fuzzy Search    --
---]]--------------[[---
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}
        },
        config = require('plugins.telescope-nvim')
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
        config = require('plugins.lsp')
    }
    -- Completion plugin
    use {
        'hrsh7th/nvim-compe',
        config = require('plugins.nvim-compe')
    }

---[[--------------]]---
--    File-related    --
---]]--------------[[---
    -- Write files without write permissions (e.g. /etc files)
    -- This 'cause I don't want to clone my Neovim configs to the root user.
    -- NOTE: It will use your current user password, not the root password.
    use 'lambdalisue/suda.vim'
    -- File formatting
    use {
        'sbdchd/neoformat',
        config = require('plugins.neoformat')
    }
    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = require('plugins.autopairs')
    }
    -- Code runner. Run install.sh as a post-installation script,
    -- it will download or compile the sniprun binary.
    use { 'michaelb/sniprun', run = 'bash install.sh' }
    -- EditorConfig support
    use 'editorconfig/editorconfig-vim'
    -- TOML support
    use 'cespare/vim-toml'
    -- Elixir support
    use 'elixir-editors/vim-elixir'

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
        config = require('plugins.tree-sitter')
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
        config = require('plugins.nvim-colorizer')
    }
    -- HTTP Client support, requires
    -- https://github.com/bayne/dot-http
    use 'bayne/vim-dot-http'
    -- Markdown previewer
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cp app && yarn install',
        config = require('plugins.mdprev')
    }
end)
