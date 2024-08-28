local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    vue = {"prettierd"},
    typescript = { "prettierd" },
    json = { "prettierd" },
    python = { "black" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    gomod = { "gofumpt", "goimports-reviser" },
    gowork = { "gomod", "goimports-reviser" },
    gotmpl = { "gomod", "goimports-reviser" },
  },

  formatters = {
    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused" },
    },
    golines = {
      prepend_args = { "--max-len=80" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
