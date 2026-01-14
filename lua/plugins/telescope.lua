return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^.git/",
        "^node_modules/",
        "^.DS_Store",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = false,
      },
    },
  },
}
