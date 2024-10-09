require('packer').startup(function()
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-autopairs'
  use 'tiagovla/tokyodark.nvim'
  use 'vim-airline/vim-airline'  
  use 'vim-airline/vim-airline-themes'
end)

-- LSP setup
local lspconfig = require'lspconfig'


lspconfig.pyright.setup{}
lspconfig.dockerls.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.marksman.setup{}  -- Markdown
lspconfig.ts_ls.setup{}
lspconfig.intelephense.setup{}  -- PHP

-- Autocompletion setup
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require'luasnip'.expand_or_jumpable() then
        require'luasnip'.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }
})

-- netrw style
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_sort_by = 'name'
vim.g.netrw_list_hide = [[\v^\.\|\.swp\|\.git\|\.DS_Store]]
vim.g.netrw_altv = 1



-- Treesitter setup (for better syntax highlighting)
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "javascript", "html", "css", "markdown"},
  highlight = { enable = true }
}

-- Auto-pairs setup (auto closing brackets and quotes)
require('nvim-autopairs').setup{}

-- Set Space as the leader key
vim.g.mapleader = ' '
vim.opt.linespace = 2

-- Set line numbers
vim.wo.number = true
vim.o.showmode = false
vim.opt.laststatus = 3



-- Apply Kanagawa theme
vim.cmd[[colorscheme tokyodark]]

-- Airline configuration
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g.airline_theme = 'minimalist'



function ToggleNetrw()
  local bufnr = vim.fn.bufnr('%')
  if vim.fn.getcmdwintype() == 'netrw' then
    vim.cmd('bd! ' .. bufnr)
  else
    vim.cmd('Lexplore')
  end
end

vim.api.nvim_set_keymap('n', '<Leader>e', ':lua ToggleNetrw()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':x!<CR>', { noremap = true, silent = true })

-- Diagnostics
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- Quick Fix
vim.api.nvim_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- Formatting
vim.api.nvim_set_keymap('n', '<Leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- Hover
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Visual mode indentation
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>c', ':Commentary<CR>', { noremap = true, silent = true })

