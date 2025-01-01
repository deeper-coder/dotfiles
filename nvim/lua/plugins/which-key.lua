return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>c"] = {
          name = "Code",
          j = { ":m .+1<CR>==", "Move current line down" },
          k = { ":m .-2<CR>==", "Move current line up" },
        },
      },
    },
  }