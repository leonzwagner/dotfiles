local options = {
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettierd" },
        html = { "prettierd" },
        vue = { "prettierd" },
        typescript = { "prettier", "prettierd" },
        javascript = { "prettier", "prettierd" },
        json = { "prettierd" },
        python = { "black" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        gomod = { "gofumpt", "goimports-reviser" },
        gowork = { "gomod", "goimports-reviser" },
        gotmpl = { "gomod", "goimports-reviser" },
        c_cpp = { "clang-format" },
        c = { "clang-format" },
        cpp = { "clang-format" }
      },

      formatters = {
        ["goimports-reviser"] = {
          prepend_args = { "-rm-unused" },
        },
        golines = {
          prepend_args = { "--max-len=80" },
        },

        -- ["clang-format"] = {
        --   prepend_args = {
        --     "-style={ \
        --     IndentWidth: 4, \
        --     TabWidth: 4, \
        --     UseTab: Never, \
        --     AccessModifierOffset: 0, \
        --     IndentAccessModifiers: true, \
        --     PackConstructorInitializers: Never}",
        --   },
        -- },
        prettier = {
          prepend_args = function()
            return {
              "--config",
              "/path/to/global/config/.prettierrc "
            }
          end,

          config_command = "--config",
          config_names = {
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".editorconfig",
          },
          config_path = ".prettierrc.json",
        }
      },


      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },


    require("conform").setup(options)
