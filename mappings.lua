local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    },
  },
}

-- my own changes
M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>b"] = "",
    ["<leader>wa"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["<tab>"] = "",
    ["<leader>h"] = "",
    ["gr"] = "",
    ["gd"] = "",
  },
}

M.comment = {
  plugin = true,

  n = {
    ["<leader>'"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>'"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<leader>nt"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.windows = {
  n = {
    [","] = {"<C-w><C-w>", "Cycles through windows"},
    ["<leader>hs"] = {"<cmd> sp <Enter>", "Creates window by horizontal split"},
    ["<leader>vs"] = {"<cmd> vsp <Enter>", "Creates window by vertical split"},
  },
}

M.tabs = {
  n = {
    ["<tab>"] = {"<cmd> tabnext <CR>", "Next tab"},
    ["<S-tab>"] = {"<cmd> tabprevious <CR>", "Previous tab"},
  },
}

M.telescope = {
  n = {
    ["<leader>s"] = {"<cmd> Telescope find_files <CR>", "Search files"},
    ["gr"] = {"<cmd> Telescope lsp_references <CR>", "Preview references"},
    ["gd"] = {"<cmd> Telescope lsp_definitions <CR>", "Preview definitions"},
  },
}

M.saving = {
  n = {
    ["<leader>w"] = {"<cmd> w <CR>", "Write (save) file"},
    ["<leader>wa"] = {"<cmd> wa <CR>", "Write (save) all files"},
  },
}

M.term = {
  n = {
    ["<leader>ht"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
    ["<leader>vt"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
  t = {
    ["<C-h>"] = { "<C-\\><C-N><C-w>h" , "Escape terminal mode and move left" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l" , "Escape terminal mode and move right" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j" , "Escape terminal mode and move down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k" , "Escape terminal mode and move up" },
  }
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["§"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-§>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

return M
