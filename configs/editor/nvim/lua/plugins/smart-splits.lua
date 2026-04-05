return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    -- Move to left window
    {
      "<C-h>",
      function() require("smart-splits").move_cursor_left() end,
      mode = { "i", "n", "v" },
      desc = "Move to left window",
    },
    -- Move to right window
    {
      "<C-l>",
      function() require("smart-splits").move_cursor_right() end,
      mode = { "i", "n", "v" },
      desc = "Move to right window",
    },
    -- Move to up window
    {
      "<C-k>",
      function() require("smart-splits").move_cursor_up() end,
      mode = { "i", "n", "v" },
      desc = "Move to upper window",
    },
    -- Move to down window
    {
      "<C-j>",
      function() require("smart-splits").move_cursor_down() end,
      mode = { "i", "n", "v" },
      desc = "Move to lower window",
    },
    -- Resize up
    {
      "<D-k>",
      function() require("smart-splits").resize_up(3) end,
      mode = { "n", "v" },
      desc = "Resize up",
    },
    -- Resize down
    {
      "<D-j>",
      function() require("smart-splits").resize_down(3) end,
      mode = { "n", "v" },
      desc = "Resize down",
    },
    -- Resize left
    {
      "<D-h>",
      function() require("smart-splits").resize_left(3) end,
      mode = { "n", "v" },
      desc = "Resize left",
    },
    -- Resize right
    {
      "<D-l>",
      function() require("smart-splits").resize_right(3) end,
      mode = { "n", "v" },
      desc = "Resize right",
    },
  },
}