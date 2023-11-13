local options = {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<C-o>"] = require("telescope.actions").select_default,
        ["<C-vs>"] = require("telescope.actions").select_vertical,
        ["<C-hs>"] = require("telescope.actions").select_horizontal,
      },
    },
  },
}

return options
