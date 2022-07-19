" General                                                                          
set colorcolumn=80                                                      
set number
                                                                                    
" Tabs and spaces                                                                  
set tabstop=4                                                         
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
                                                                                    
" Other                                                                            
set lazyredraw
set redrawtime=10000                                                     
set synmaxcol=180                                                       
set re=1                                                         
                                                                                    
" Search
set smartcase

call plug#begin()

" Colorschemes                                                             
Plug 'endel/vim-github-colorscheme'                                          
Plug 'morhetz/gruvbox'                                                       
                                                                            
" File explorer
Plug 'preservim/nerdtree'                                                    
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP server configs
Plug 'neovim/nvim-lspconfig'

" Better escape via 'jk'
Plug 'jdhao/better-escape.vim'

" Debug via gdb 
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

call plug#end()

" Colorscheme                                                                      
colorscheme github

let g:fzf_layout = { 'down': '~40%' }

" LSP configuration

lua << EOF
-- Mappings.                                                                        
-- See `:help vim.diagnostic.*` for documentation on any of the below functions     
local opts = { noremap=true, silent=true }                                          
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)                    
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)                           
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)                           
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)                    
                                                                                    
-- Use an on_attach function to only map the following keys                         
-- after the language server attaches to the current buffer                         
local on_attach = function(client, bufnr)                                           
  -- Enable completion triggered by <c-x><c-o>                                      
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')          
                                                                                    
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- disable virtual text
      virtual_text = true,

      -- show signs
      signs = false,

      -- delay update diagnostics
      update_in_insert = false,
    }
  )

  -- Mappings.                                                                      
  -- See `:help vim.lsp.*` for documentation on any of the below functions          
  local bufopts = { noremap=true, silent=true, buffer=bufnr }                       
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)                       
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)                        
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)                              
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)                    
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)                 
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)       
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)    
  vim.keymap.set('n', '<space>wl', function()                                       
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))                        
  end, bufopts)                                                                     
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)             
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)                     
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)                
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)                        
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)                  
  end
                                                                                    
local lsp_flags = {                                                                 
  -- This is the default in Nvim 0.7+                                               
  debounce_text_changes = 150,                                                      
}                                                                                   
require('lspconfig')['clangd'].setup{                                               
    on_attach = on_attach,                                                          
    flags = lsp_flags,                                                              
}  

EOF

" fzf mappings
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 
