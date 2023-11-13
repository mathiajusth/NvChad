local cmp = require "cmp"

local plugins = {
  -- OVERRIDES
  { "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "elm-language-server",
      },
    },
  },
  { "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "elm",
        -- "vue", "svelte",

       -- low level
        "rust",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local defaultOpts = require "plugins.configs.telescope"
      local myOps = require "custom.configs.telescope"
      return vim.tbl_deep_extend("force", defaultOpts, myOps)
    end,
  },


  -- MINE
  ---- Rust
  { "williamboman/mason-lspconfig.nvim", },
  { "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  { "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  { 'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  { "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  -- DEBUGGING
  -- { "mfussenegger/nvim-dap",
  --   init = function()
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  -- { "theHamsta/nvim-dap-virtual-text",
  --   lazy = false,
  --   config = function(_, opts)
  --     require("nvim-dap-virtual-text").setup()
  --   end
  -- },
  { "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
  { "anuvyklack/pretty-fold.nvim",
    lazy = false,
    config = function()
      require('pretty-fold').setup()
    end
  },
  { "anuvyklack/hydra.nvim",
    init = function (_)
      local hydra = require('hydra')

      hydra({
         name = 'Window resize',
         mode = 'n',
         body = '<leader>b',
         heads = {
            { 'j', '<cmd> res +3 <CR>' },
            { 'k', '<cmd> res -3 <CR>' },
            { 'h', '<cmd> vertical res -3 <CR>' },
            { 'l', '<cmd> vertical res +3 <CR>' },
         }
      })

      hydra({
         name = 'Tab navigation',
         mode = 'n',
         body = 't',
         heads = {
            { 'n', '<cmd> tabnew <CR>' },
            { 'd', '<cmd> tabclose <CR>' },
            { 'D', '<cmd> tabclose! <CR>' },
            { 'h', '<cmd> tabprevious <CR>' },
            { 'l', '<cmd> tabnext <CR>' },
            { 'm', '<cmd> +tabmove <CR>' },
            { 'M', '<cmd> -tabmove <CR>' },
            { '1', '1gt' },
            { '2', '2gt' },
            { '3', '3gt' },
            { '4', '4gt' },
            { '5', '5gt' },
            { '6', '6gt' },
            { '7', '7gt' },
            { '8', '8gt' },
            { '9', '9gt' },
         }
      })
    end

  }
}
return plugins
