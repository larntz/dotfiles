-- paq installation:
-- https://github.com/savq/paq-nvim
--
-- linux
-- git clone --depth=1 https://github.com/savq/paq-nvim.git \
--  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
--
--  windows
--  git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\nvim-data\site\pack\paqs\start\paq-nvim"
--

require "paq" {
	'savq/paq-nvim'; 
	'neovim/nvim-lspconfig';
	'simrat39/rust-tools.nvim';
	'rust-lang/rust.vim';
	'crispgm/nvim-go';
	'nvim-treesitter/nvim-treesitter';
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'hrsh7th/nvim-compe';
	'kyazdani42/nvim-web-devicons';
	'morhetz/gruvbox';
  'eddyekofo94/gruvbox-flat.nvim';
	'lewis6991/gitsigns.nvim';
	'lukas-reineke/indent-blankline.nvim';
  'kyazdani42/nvim-web-devicons';
  'kyazdani42/nvim-tree.lua';
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>:GoTest<CR>', opts)

end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('rust')
-- require('lspconfig').gopls.setup({})
-- require('lspconfig').pyright.setup{}
-- require('lspconfig').vuels.setup{}
-- require('lspconfig').tsserver.setup{}

require('go').config.update_tool('quicktype', function(tool)
    tool.pkg_mgr = 'npm'
end)
require'lspconfig'.terraformls.setup{}
require('complete')
require('statusline')
require('gitsigns').setup()


vim.lsp.buf.formatting_sync()
vim.lsp.diagnostic.show_line_diagnostics()
vim.o.completeopt = "menuone,noselect"
vim.o.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.number = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.mouse = "n"
-- vim.o.cmdheight = 2

vim.g.gruvbox_transparent = true
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_flat_style = "dark"
vim.cmd('colorscheme gruvbox-flat')

vim.g.rustfmt_autosave = 1

vim.cmd('autocmd FileType markdown setlocal spell spelllang=en_us')
vim.cmd('autocmd FileType asciidoc setlocal spell spelllang=en_us')


vim.cmd('nnoremap <C-n> :NvimTreeToggle<CR>')
vim.cmd('nnoremap <leader>r :NvimTreeRefresh<CR>')
vim.cmd('nnoremap <leader>n :NvimTreeFindFile<CR>')
vim.cmd('highlight NvimTreeFolderIcon guibg=blue')
require('nvim-tree').setup({
    filters = {
      dotfiles = true,
      custom = {}
    },
    view = {
      auto_resize=true
    }
  })
