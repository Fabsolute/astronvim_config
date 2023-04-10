local colors = require "astrotheme.colors"

return {
  "petertriho/nvim-scrollbar",
  event = "User AstroFile",
  opts = {
    excluded_buftypes = {},
    excluded_filetypes = {
      "NvimTree",
    },
    handle = {
      color = colors.blue_1,
    },
    marks = {
      Search = { color = colors.yellow },
      Error = { color = colors.red_1 },
      Warn = { color = colors.orange_1 },
      Info = { color = colors.blue },
      Hint = { color = colors.purple },
      Misc = { color = colors.blue },
    },
  },
}
