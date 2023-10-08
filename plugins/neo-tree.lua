return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    config_file = vim.fn.getcwd() .. "/.neo-tree-config.lua"
    local config_fn = loadfile(config_file)
    opts.filesystem.filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_by_name = {
        ".neo-tree-config.lua",
      },
    }

    opts.sort_function = function(a, b)
      local a_priority = b.filtered_by and 1000 or (opts.sort_priority and opts.sort_priority[a.name] or 0)
      local b_priority = a.filtered_by and 1000 or (opts.sort_priority and opts.sort_priority[b.name] or 0)

      a_priority = a_priority + (a.type < b.type and 100 or 0)
      b_priority = b_priority + (b.type < a.type and 100 or 0)

      a_priority = a_priority + (string.sub(b.name or "", 1, 1) == "." and 10 or 0)
      b_priority = b_priority + (string.sub(a.name or "", 1, 1) == "." and 10 or 0)

      a_priority = a_priority + (a.path < b.path and 1 or 0)
      b_priority = b_priority + (b.path < a.path and 1 or 0)

      return a_priority > b_priority
    end

    if config_fn ~= nil then
      succeeded, new_opts = pcall(config_fn(), opts)
      if succeeded then opts = new_opts end
    end

    return opts
  end,
}
