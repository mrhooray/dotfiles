-- option
vim.opt.backup = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.colorcolumn = '120'
vim.opt.completeopt = 'menuone,noselect'
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.iskeyword:append('-')
vim.opt.laststatus = 2
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.shortmess:append('c')
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = false
vim.opt.updatetime = 320
vim.opt.wrap = false
vim.opt.writebackup = false

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- keymap
local km_opts = { noremap = true, silent = false }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Space>', '<Nop>', km_opts)
vim.keymap.set('n', 'q', '<Nop>', km_opts)
vim.keymap.set('n', 'Q', '<Nop>', km_opts)

vim.keymap.set('n', '<leader>w', ':w!<cr>', km_opts)
vim.keymap.set('n', '<leader>r', ':e!<cr>', km_opts)
vim.keymap.set('n', '<leader>c', ':e! $MYVIMRC<cr>', km_opts)
vim.keymap.set('n', '<leader>bn', ':bn<cr>', km_opts)
vim.keymap.set('n', '<leader>bp', ':bp<cr>', km_opts)
vim.keymap.set('n', '<leader>p', ':set paste<cr>', km_opts)
vim.keymap.set('n', '<leader>pp', ':set nopaste<cr>', km_opts)

vim.keymap.set('n', '<C-h>', '<C-w>h', km_opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', km_opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', km_opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', km_opts)

vim.keymap.set('v', 'p', '"_dP', km_opts)

vim.keymap.set('v', '<', '<gv', km_opts)
vim.keymap.set('v', '>', '>gv', km_opts)

-- autocmd
local au_config_reload = vim.api.nvim_create_augroup('au_config_reload', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = au_config_reload,
  pattern = vim.fn.expand('$MYVIMRC'),
})

local au_file_reload = vim.api.nvim_create_augroup('au_file_reload', { clear = true })
vim.api.nvim_create_autocmd('FocusGained,BufEnter,CursorHold,CursorHoldI', {
  command = 'if mode() != "c" | checktime | endif',
  group = au_file_reload,
  pattern = '*',
})
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
  group = au_file_reload,
  pattern = '*',
})

-- packer
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_is_bootstrap = false
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  packer_is_bootstrap = true
  vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
  vim.cmd('packadd packer.nvim')
end

require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')
  use('ahmedkhalf/project.nvim')
  use('akinsho/toggleterm.nvim')

  use('mg979/vim-visual-multi')
  use('windwp/nvim-autopairs')
  use('cappyzawa/trim.nvim')

  use('ggandor/lightspeed.nvim')
  use('ethanholz/nvim-lastplace')

  use('Mofiqul/dracula.nvim')
  use('nvim-lualine/lualine.nvim')
  use('lewis6991/gitsigns.nvim')

  use('kyazdani42/nvim-tree.lua')
  use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable('make') == 1 })

  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')

  use('nvim-treesitter/nvim-treesitter')
  use('nvim-treesitter/nvim-treesitter-textobjects')

  use({ 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } })
  use({ 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } })

  if packer_is_bootstrap then
    require('packer').sync()
  end
end)

if packer_is_bootstrap then
  return
end

vim.keymap.set('n', '<leader>ps', ':PackerSync<cr>', km_opts)

-- project
require('project_nvim').setup()

-- toggleterm
require('toggleterm').setup({
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
})

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], km_opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], km_opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], km_opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], km_opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- nvim-tree
require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
  },
  git = {
    enable = false,
  },
  renderer = {
    group_empty = true,
  },
})
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<cr>', km_opts)
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<cr>', km_opts)

-- autopairs
require('nvim-autopairs').setup()

-- trim
require('trim').setup({ disable = { 'markdown' } })

-- lightspeed
require('lightspeed').setup({ ignore_case = true })

-- lastplace
require('nvim-lastplace').setup()

-- dracula
vim.cmd('colorscheme dracula')

-- lualine
require('lualine').setup({ theme = 'auto' })

-- gitsigns
require('gitsigns').setup()

-- telescope
local ts_actions = require('telescope.actions')
local ts_builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    path_display = { 'smart' },
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    mappings = {
      i = {
        ['<C-n>'] = ts_actions.cycle_history_next,
        ['<C-p>'] = ts_actions.cycle_history_prev,
        ['<C-j>'] = ts_actions.move_selection_next,
        ['<C-k>'] = ts_actions.move_selection_previous,
        ['<C-[>'] = ts_actions.preview_scrolling_up,
        ['<C-]>'] = ts_actions.preview_scrolling_down,
        ['<C-d>'] = ts_actions.delete_buffer,
        ['<C-c>'] = ts_actions.close,
        ['<CR>'] = ts_actions.select_default,
      },
      n = {
        ['j'] = ts_actions.move_selection_next,
        ['k'] = ts_actions.move_selection_previous,
        ['<C-[>'] = ts_actions.preview_scrolling_up,
        ['<C-]>'] = ts_actions.preview_scrolling_down,
        ['<C-d>'] = ts_actions.delete_buffer,
        ['<esc>'] = ts_actions.close,
        ['<CR>'] = ts_actions.select_default,
      },
    },
  },
})

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[/] Fuzzy search in current buffer]' })

vim.keymap.set('n', '<leader>sf', ts_builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', ts_builtin.buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>so', ts_builtin.oldfiles, { desc = '[S]earch [O]ld files' })
vim.keymap.set('n', '<leader>sh', ts_builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', ts_builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', ts_builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', ts_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- lsp
local lsp_lua_runtime_path = vim.split(package.path, ';')
table.insert(lsp_lua_runtime_path, 'lua/?.lua')
table.insert(lsp_lua_runtime_path, 'lua/?/init.lua')
local lsp_servers = { 'rust_analyzer', 'tsserver', 'sumneko_lua' }
local lsp_settings = {
  sumneko_lua = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = lsp_lua_runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
    },
  },
}
local lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_on_attach = function(client, bufnr)
  local disable_formatting = { 'tsserver', 'sumneko_lua' }
  for _, v in ipairs(disable_formatting) do
    if v == client.name then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')
end

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = lsp_servers,
})

for _, lsp in ipairs(lsp_servers) do
  require('lspconfig')[lsp].setup({
    on_attach = lsp_on_attach,
    capabilities = lsp_capabilities,
    settings = lsp_settings[lsp],
  })
end

require('null-ls').setup({
  sources = {
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.formatting.prettier,
  },
  on_attach = function(client)
    local au_auto_format = vim.api.nvim_create_augroup('au_auto_format', { clear = true })
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '<buffer>',
        group = au_auto_format,
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
})

vim.keymap.set('n', '<leader>lm', ':Mason<cr>', km_opts)
vim.keymap.set('n', '<leader>li', ':LspInfo<cr>', km_opts)

-- treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'javascript', 'lua', 'rust' },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = {} },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
  },
})

-- cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})
