require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
        git = true
      }
    }
  },
  filters = {
    dotfiles = true,
  },
})
