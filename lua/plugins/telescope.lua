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
        no_ignore_parent = false,
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob", "!.git/*",
          "--glob", "!node_modules/*",
          "--glob", "!.DS_Store",
          "--glob", ".cursor/**",
        },
      },
    },
  },
}
