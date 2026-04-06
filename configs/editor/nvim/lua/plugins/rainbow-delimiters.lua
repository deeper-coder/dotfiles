return {
  "HiPhish/rainbow-delimiters.nvim",
  init = function()
    vim.g.rainbow_delimiters = {
      blacklist = {
        "txt",
        "markdown",
        "log",
      },
    }
  end,
}
