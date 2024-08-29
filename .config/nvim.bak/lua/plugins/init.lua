return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
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
        "pylsp",
        "flake8",
        "typescript-language-server",
        "prisma-language-server",
        "json-lsp",
        "tailwindcss-language-server",
        "emmet-ls",
        "dockerfile",
        "docker-compose-language-service",
        "texlab",
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
        "dockerfile",
        "latex",
        "json",
      },
    },
  },

  -- autosave
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
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
      require("dbee").setup(--[[optional config]])
    end,
  },

  --latex
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    ft = { "tex" },
    init = function()
      -- VimTeX configuration goes here
      vim.cmd "filetype plugin indent on"
      vim.cmd "syntax enable"

      -- Viewer options
      vim.g.vimtex_view_method = "zathura"
      -- vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

      -- Compiler method
      vim.g.vimtex_compiler_method = "tectonic"

      -- Mapping local leader key
      --[[  vim.g.maplocalleader = "," ]]

      -- Autocmd to set b: vimtex_main
      vim.api.nvim_create_augroup("VimTeX", { clear = true })
      vim.api.nvim_create_autocmd("BufReadPre", {
        group = "VimTeX",
        pattern = "$HOME/Note-Taking/*",
        callback = function()
          vim.b.vimtex_main = "$HOME/Note-Taking/Math/*.tex"
        end,
      })
    end,
    keys = {
      { "<localleader>ll", ":VimtexCompile<CR>", desc = "Compile LaTeX" },
      { "<localleader>lv", ":VimtexView<CR>", desc = "View PDF" },
    },
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
  {
    "IogaMaster/neocord",
    event = "VeryLazy",
    -- The setup config table shows all available config options with their default values:
    config = function()
      require("neocord").setup {
        -- General options
        logo = "auto", -- "auto" or url
        logo_tooltip = nil, -- nil or string
        main_image = "language", -- "language" or "logo"
        client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- Show the timer
        global_timer = false, -- if set true, timer won't update when any event are triggered

        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        terminal_text = "Using Terminal", -- Format string rendered when in terminal mode.
      }
    end,
  },
}
