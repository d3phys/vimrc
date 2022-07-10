return require('packer').startup(function()
        -- Plugin/package manager
        use 'wbthomason/packer.nvim'

        -- Colorschemes
        use 'endel/vim-github-colorscheme'
        use 'morhetz/gruvbox'

        -- File explorer
        use 'preservim/nerdtree'

        -- LSP (Language Server Protocol)
        use 'neovim/nvim-lspconfig'

        -- Autocomplete
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

        -- Snippets 
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'
        
        -- Escaping INSERT mode via 'jk'
        use {
          'jdhao/better-escape.vim', 
          event = 'InsertEnter'
        }
        
end)


