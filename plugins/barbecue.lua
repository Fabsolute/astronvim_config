return {
  "utilyre/barbecue.nvim",
  event = "User AstroFile",
  dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
  config = function() require("barbecue").setup() end,
}
