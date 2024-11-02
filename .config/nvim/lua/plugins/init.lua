return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  { 'hrsh7th/cmp-nvim-lsp' },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.format_on_save({
        format_opts = {
          async = true,
          timeout_ms = 10000,
        },
        servers = {
          ['clangd'] = { 'c', 'cpp' },
        }
      })
    end
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- mason nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "vue-language-server",
        "pylsp",
        "black",
        "flake8",
        "typescript-language-server",
        "prisma-language-server",
        "json-lsp",
        "tailwindcss-language-server",
        "emmet-ls",
        "dockerfile",
        "docker-compose-language-service",
        "texlab",
        "biome",
        "gopls",
        "eslint-lsp",
        "clangd",
        "svelte-language-server",
        "texlab",
        "kotlin-language-server",
        "typst-lsp"
      },
    },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "prisma",
        "python",
        "typescript",
        "javascript",
        "jsx",
        "tsx",
        "dockerfile",
        "json",
        "org",
        "vue",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "c",
        "cpp",
        "cmake",
        "make",
        "svelte",
        "latex",
        "markdown",
        "typst"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "latex", "markdown" }
      }
    },
  },

  -- treesitter context
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("nvim-treesitter-context").setup {
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },

  -- autosave
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",                         -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      -- your config goes here
      -- or just leave it empty :)
    },
  },

  -- autotag
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascriptreact",
      "typescriptreact",
      "javascript",
      "typescript",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  --better escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- supermaven
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info",                -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false,           -- disables built in keymaps for more manual control
      }
    end,
  },

  -- surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  --lightspeed.nvim
  {
    "ggandor/lightspeed.nvim",
    event = "VeryLazy",
  },

  -- nvim dbee
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
    end,
  },

  -- prettierme
  {
    "ruyadorno/prettierme",
    config = function()
      require("prettierme").setup()
    end,
  },

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.

      --viewer method
      vim.g.vimtex_view_method = "sumatrapdf"
      vim.g.vimtex_compiler_method = 'latexrun'
      vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]

      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_quickfix_mode = 0

      -- Mapping local leader
      vim.g.maplocalleader = ","
    end,

    ft = "tex"
  },

  --rainbow indent
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      -- Other blankline configuration here
      return require("indent-rainbowline").make_opts(opts)
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },

  --wakatime
  { "wakatime/vim-wakatime", lazy = false },

  --nvim rich presence
  -- {
  --   "IogaMaster/neocord",
  --   event = "VeryLazy",
  --   -- The setup config table shows all available config options with their default values:
  --   config = function()
  --     require("neocord").setup {
  --       -- General options
  --       logo = "auto", -- "auto" or url
  --       logo_tooltip = nil, -- nil or string
  --       main_image = "language", -- "language" or "logo"
  --       client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
  --       log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  --       debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  --       blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  --       file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  --       show_time = true, -- Show the timer
  --       global_timer = false, -- if set true, timer won't update when any event are triggered
  --
  --       -- Rich Presence text options
  --       editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  --       file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  --       git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  --       plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  --       reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  --       workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  --       line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
  --       terminal_text = "Using Terminal", -- Format string rendered when in terminal mode.
  --     }
  --   end,
  -- },

  -- cord.nvim
  {
    "vyfor/cord.nvim",
    build = "./build",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("cord").setup {
        usercmds = true,           -- Enable user commands
        log_level = "error",       -- One of 'trace', 'debug', 'info', 'warn', 'error', 'off'
        timer = {
          interval = 1500,         -- Interval between presence updates in milliseconds (min 500)
          reset_on_idle = false,   -- Reset start timestamp on idle
          reset_on_change = false, -- Reset start timestamp on presence change
        },
        editor = {
          image = nil,                          -- Image ID or URL in case a custom client id is provided
          client = "neovim",                    -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
          tooltip = "The Superior Text Editor", -- Text to display when hovering over the editor's image
        },
        display = {
          show_time = true,             -- Display start timestamp
          show_repository = true,       -- Display 'View repository' button linked to repository url, if any
          show_cursor_position = false, -- Display line and column number of cursor's position
          swap_fields = false,          -- If enabled, workspace is displayed first
          swap_icons = false,           -- If enabled, editor is displayed on the main image
          workspace_blacklist = {},     -- List of workspace names to hide
        },
        lsp = {
          show_problem_count = false, -- Display number of diagnostics problems
          severity = 1,               -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
          scope = "workspace",        -- buffer or workspace
        },
        idle = {
          enable = true, -- Enable idle status
          show_status = true, -- Display idle status, disable to hide the rich presence on idle
          timeout = 300000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
          disable_on_focus = false, -- Do not display idle status when neovim is focused
          text = "Idle", -- Text to display when idle
          tooltip = "💤", -- Text to display when hovering over the idle image
        },
        text = {
          viewing = "Viewing {}",                    -- Text to display when viewing a readonly file
          editing = "Editing {}",                    -- Text to display when editing a file
          file_browser = "Browsing files in {}",     -- Text to display when browsing files (Empty string to disable)
          plugin_manager = "Managing plugins in {}", -- Text to display when managing plugins (Empty string to disable)
          lsp_manager = "Configuring LSP in {}",     -- Text to display when managing LSP servers (Empty string to disable)
          vcs = "Committing changes in {}",          -- Text to display when using Git or Git-related plugin (Empty string to disable)
          workspace = "In {}",                       -- Text to display when in a workspace (Empty string to disable)
        },
        buttons = {
          {
            label = "View Repository", -- Text displayed on the button
            url = "git",               -- URL where the button leads to ('git' = automatically fetch Git repository URL)
          },
          -- {
          --   label = 'View Plugin',
          --   url = 'https://github.com/vyfor/cord.nvim',
          -- }
        },
        assets = nil, -- Custom file icons, see the wiki*
        -- assets = {
        --   lazy = {                                 -- Vim filetype or file name or file extension = table or string
        --     name = 'Lazy',                         -- Optional override for the icon name, redundant for language types
        --     icon = 'https://example.com/lazy.png', -- Rich Presence asset name or URL
        --     tooltip = 'lazy.nvim',                 -- Text to display when hovering over the icon
        --     type = 2,                              -- 0 = language, 1 = file browser, 2 = plugin manager, 3 = lsp manager, 4 = vcs; defaults to language
        --   },
        --   ['Cargo.toml'] = 'crates',
        -- },
      }
    end,
  },

  -- markdown-preview-live
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- zen mode
  {
    "folke/zen-mode.nvim",
    opts = {},
  },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        user_default_options = {
          tailwind = true,
        },
      }
    end,
  },

  -- hovercraft
  {
    "patrickpichler/hovercraft.nvim",

    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },

    -- this is the default config and can be skipped
    opts = function()
      return {
        providers = {
          providers = {
            {
              "LSP",
              require("hovercraft.provider.lsp.hover").new(),
            },
            {
              "Man",
              require("hovercraft.provider.man").new(),
            },
            {
              "Dictionary",
              require("hovercraft.provider.dictionary").new(),
            },
          },
        },

        window = {
          border = "single",
        },

        keys = {
          {
            "<C-u>",
            function()
              require("hovercraft").scroll { delta = -4 }
            end,
          },
          {
            "<C-d>",
            function()
              require("hovercraft").scroll { delta = 4 }
            end,
          },
          {
            "<TAB>",
            function()
              require("hovercraft").hover_next()
            end,
          },
          {
            "<S-TAB>",
            function()
              require("hovercraft").hover_next { step = -1 }
            end,
          },
        },
      }
    end,

    keys = {
      {
        "K",
        function()
          local hovercraft = require "hovercraft"

          if hovercraft.is_visible() then
            hovercraft.enter_popup()
          else
            hovercraft.hover()
          end
        end,
      },
    },
  },

  -- code-snap
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      save_path = "~/Pictures",
      has_breadcrumbs = true,
      bg_theme = "bamboo",
    },
  },

  -- carbon now
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = {},
  },

  -- Neovim Org mode
  -- {
  --   "nvim-orgmode/orgmode",
  --   event = "VeryLazy",
  --   ft = { "org" },
  --   config = function()
  --     -- Setup orgmode
  --     require("orgmode").setup {
  --       org_agenda_files = "~/orgfiles/**/*",
  --       org_default_notes_file = "~/orgfiles/refile.org",
  --     }
  --
  --     -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
  --     -- add ~org~ to ignore_install
  --     -- require('nvim-treesitter.configs').setup({
  --     --   ensure_installed = 'all',
  --     --   ignore_install = { 'org' },
  --     -- })
  --   end,
  -- },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

  {
    "lervag/vimtex",
    lazy = false, -- agar VimTeX tidak menggunakan lazy loading
    -- tag = "v2.15", -- Uncomment jika ingin mengunci pada versi spesifik
    init = function()
      -- Konfigurasi VimTeX
      vim.g.vimtex_view_method = "zathura"                                      -- Menggunakan zathura sebagai PDF viewer
      vim.g.vimtex_compiler_method =
      "tectonic"                                                                -- Menggunakan latexmk untuk compile LaTeX
      vim.g.maplocalleader = ","                                                -- Mengatur local leader key
      vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]] -- Viewer dengan opsi untuk sinkronisasi
      vim.g.vimtex_quickfix_enabled = 1                                         -- Mengaktifkan quickfix window untuk error/warning
      vim.g.vimtex_syntax_enabled = 1                                           -- Mengaktifkan syntax highlighting untuk LaTeX
      vim.g.vimtex_quickfix_mode = 0                                            -- Menonaktifkan quickfix auto-jump ke error pertama
      vim.g.vimtex_compile_on_writing = 1                                       -- otomatis kompilasi saat menulis
      vim.api.nvim_set_keymap('n', '<F5>', ':VimtexCompile<CR>', { noremap = true, silent = true })
    end,
    ft = "tex", -- Hanya aktif pada file dengan ekstensi .tex
  },

  {
    "azpect3120/gomon.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- REQUIRED
      require("gomon").setup({
        window = {
          -- Style of the output window
          -- e.g. float, split_right, split_left, split_bottom, split_top
          style = "float",
          -- Size of the output window. Only used for float style
          -- e.g. small, medium, large
          size = "medium",
          -- Title of the output window
          title = " GoMon Output... ",
          -- Border style of the output window. Only used for float style
          -- e.g. single, double, rounded, shadow, or an array of chars
          border = "rounded",
          -- Wrap text in the output window
          wrap = false,
        },
        -- Open the output window on start
        display_on_start = true,
        -- Close the output window on stop
        close_on_stop = true,
      })
    end
  },

  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    build = function() require 'typst-preview'.update() end,
    config = function()
      require 'typst-preview'.setup {
        -- Setting this true will enable printing debug information with print()
        debug = false,

        -- Custom format string to open the output link provided with %s
        -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
        open_cmd = nil,

        -- Setting this to 'always' will invert black and white in the preview
        -- Setting this to 'auto' will invert depending if the browser has enable
        -- dark mode
        -- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
        -- your choice of color inversion to images and everything else
        -- separately.
        invert_colors = 'never',

        -- Whether the preview will follow the cursor in the source file
        follow_cursor = true,

        -- Provide the path to binaries for dependencies.
        -- Setting this will skip the download of the binary by the plugin.
        -- Warning: Be aware that your version might be older than the one
        -- required.
        dependencies_bin = {
          ['tinymist'] = nil,
          ['websocat'] = nil
        },

        -- A list of extra arguments (or nil) to be passed to previewer.
        -- For example, extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
        extra_args = nil,

        -- This function will be called to determine the root of the typst project
        get_root = function(path_of_main_file)
          return vim.fn.fnamemodify(path_of_main_file, ':p:h')
        end,

        -- This function will be called to determine the main file of the typst
        -- project.
        get_main_file = function(path_of_buffer)
          return path_of_buffer
        end,
      }
    end
  },


}
