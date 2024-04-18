local cmp = require "cmp"


local plugins = {
  -- {
  --   "stevearc/conform.nvim",
  --   -- event = 'BufWritePre' -- uncomment for format on save
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "rustaceanvim",
        "lsp-inlayhints",
        "cmake-tools"
      },
    },
  },
  {
    "lvimuser/lsp-inlayhints.nvim"
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("telescope").load_extension("ui-select")
    end
  },
  { 
    "Civitasv/cmake-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim"
  },
  {
    "David-Kunz/gen.nvim",
    dependencies = "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "folke/neodev.nvim",
    opts = {}
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "configs.null-ls"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "configs.rustaceanvim"
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
    end,
    keys = require("configs.mappings").dap
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
    end,
    keys = require("configs.mappings").crates
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, _)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
  }
}
return plugins
