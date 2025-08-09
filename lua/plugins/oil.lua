return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "type",
      "size",
      "mtime",
      "icon",
    },
    view_options = {
      show_hidden = true,
    },
  },
  config = function(_, opts) require("oil").setup(opts) end,
}
