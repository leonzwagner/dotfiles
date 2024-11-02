-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers r { "html", "cssls", "tailwindcss", "pylsp", "ts_ls", "volar", "gopls", "eslint", "clangd", "denols",
  "texlab", "typst_lsp" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- deno
lspconfig.denols.setup {
  on_attach = on_attach,
  on_init = on_init,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
}

-- latex
lspconfig.texlab.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = true,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = true,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}

-- html
lspconfig.html.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "eslint",
  },
  root_dir = lspconfig.util.root_pattern("tailwind.config.js", "package.json"),
  settings = {},
}

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

-- svelte
lspconfig.svelte.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- lspconfig.biome.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- eslint
lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- vue
lspconfig.volar.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- go
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticCheck = true,
    },
  },
}

-- python
lspconfig.pylsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
})

-- emmetls
lspconfig.emmet_ls.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
}

-- kotlin
lspconfig.ast_grep.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init
}

-- typst
lspconfig.typst_lsp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init
}

