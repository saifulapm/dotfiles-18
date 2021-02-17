vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }
    -- Fancy start screen
    use 'mhinz/vim-startify'
    -- Colorscheme
    use 'sainnhe/sonokai'
    -- File icons
    use 'kyazdani42/nvim-web-devicons'
    -- File tree
    use 'kyazdani42/nvim-tree.lua'
    -- Statusline
    use { 'hoob3rt/lualine.nvim' }
    -- Tabline
    use 'romgrk/barbar.nvim'
    -- Git gutter alternative
    use 'mhinz/vim-signify'
    -- LazyGit integration
    use 'kdheepak/lazygit.nvim'
    -- Built-in LSP Config
    use 'neovim/nvim-lspconfig'
    -- Completion plugin
    use 'hrsh7th/nvim-compe'
    -- Better terminal
    use 'akinsho/nvim-toggleterm.lua'
    -- Better splits
    use 'beauwilliams/focus.nvim'
    -- Keybindings menu like SpaceVim
    use 'dpretet/vim-leader-mapper'
    -- File formatting
    use 'sbdchd/neoformat'
    -- Autopairs
    use 'windwp/nvim-autopairs'
    -- Discord RPC
    use 'andweeb/presence.nvim'
    -- Viewer & finder for LSP symbols and tags
    use 'liuchengxu/vista.vim'
    -- Snippets
    use 'hrsh7th/vim-vsnip'
    -- Minimap, requires wfxr/code-minimap
    use 'wfxr/minimap.vim'
    -- Tree-sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Commenting plugin
    use 'b3nj5m1n/kommentary'
    -- Vlang support
    use 'ollykel/v-vim'
    -- EditorConfig support
    use 'editorconfig/editorconfig-vim'
end)
