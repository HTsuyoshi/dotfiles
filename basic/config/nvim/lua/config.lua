local cmp = require'cmp'
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered({ border = 'shadow' }),
    documentation = cmp.config.window.bordered({ border = 'shadow' }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(
      function(fallback)
        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      end,
      { 'i', 's', --[[ 'c' (to enable the mapping in command mode) ]] }
    ),
    ['<S-Tab>'] = cmp.mapping(
      function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
      end,
      { 'i', 's', --[[ 'c' (to enable the mapping in command mode) ]] }
    ),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
	{ name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

require('lspconfig').pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

require('lspconfig').texlab.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Terraform

require('lspconfig').terraformls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

require('lspconfig').tflint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help", "query" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript", "java", "c_sharp" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require('presence'):setup({
		-- General options
		auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
		neovim_image_text   = 'The One True Text Editor', -- Text displayed when hovered over the Neovim image
		main_image          = 'neovim',                   -- Main image display (either 'neovim' or 'file')
		client_id           = '793271441293967371',       -- Use your own Discord application client id (not recommended)
		log_level           = nil,                        -- Log messages at or above this level (one of the following: 'debug', 'info', 'warn', 'error')
		debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
		enable_line_number  = false,                      -- Displays the current line number instead of the current project

		-- Rich Presence text options
		editing_text        = 'Editing %s',               -- Format string rendered when an editable file is loaded in the buffer
		file_explorer_text  = 'Browsing %s',              -- Format string rendered when browsing a file explorer
		git_commit_text     = 'Committing changes',       -- Format string rendered when commiting changes in git plugin_manager_text = 'Managing plugins',         -- Format string rendered when managing plugins
		reading_text        = 'Reading %s',               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer
		workspace_text      = 'Working on %s',            -- Workspace format string (either string or function(git_project_name: string|nil, buffer: string): string)
		line_number_text    = 'Line %s out of %s',        -- Line number format string (for when enable_line_number is set to true)
})
