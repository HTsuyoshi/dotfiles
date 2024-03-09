local cmp = require('cmp')
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
    { name = 'ultisnips' }, { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- Set up lspconfig.

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C

require('lspconfig').clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Python

require('lspconfig').pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Tex

require('lspconfig').texlab.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- HTML

require('lspconfig').html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- CSS

require('lspconfig').cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Javascript/Typescript

require('lspconfig').eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
  settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  codeActionOnSave = {
    enable = true,
    mode = "all"
  },
  experimental = {
    useFlatConfig = false
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  problems = {
    shortenToSingleLine = false
  },
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location"
  }
}
}

---- Typescript
--
--require('lspconfig').tsserver.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" }
--}

-- Typescript Vue

--require'lspconfig'.vue_language_server.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  flags = {
--    debounce_text_changes = 150,
--  },
--  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
--}

---- GLSL
--
--require('lspconfig').glslls.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  filetypes = {},
--  cmd = {"glslls", "--stdin"},
--  flags = {
--    debounce_text_changes = 150,
--  }
--}

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

---- haxe
--
--require('lspconfig').haxe_language_server.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  flags = { debounce_text_changes = 150, },
--  cmd = { "node", "/home/feeva/programs/server.js" },
--}

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

require'nvim-treesitter.parsers'.get_parser_configs().haxe = {
  install_info = {
    url = 'https://github.com/vantreeseba/tree-sitter-haxe',
    files = {'src/parser.c'},
    -- optional entries:
    branch = 'main',
  },
  filetype = 'haxe',
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

require('trouble').setup({
	icons = false,
	fold_open = "v", -- icon used for open folds
	fold_closed = ">", -- icon used for closed folds
	indent_lines = false, -- add an indent guide below the fold icons
	signs = {
		-- icons / text used for a diagnostic
		error = "error",
		warning = "warn",
		hint = "hint",
		information = "info"
	},
	use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
{silent = true, noremap = true}
)

require('onedark').setup  {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

--require('ayu').setup({
--    mirage = true,
--    overrides = {
--        Normal = { bg = "None" },
--        ColorColumn = { bg = "None" },
--        SignColumn = { bg = "None" },
--        Folded = { bg = "None" },
--        FoldColumn = { bg = "None" },
--        CursorLine = { bg = "None" },
--        CursorColumn = { bg = "None" },
--        WhichKeyFloat = { bg = "None" },
--        VertSplit = { bg = "None" },
--    },
--})
