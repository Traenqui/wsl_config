local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000
}

M.config = function()
  flavour = "macchiato",
  vim.cmd([[colorscheme catppuccin-macchiato]])
end

return M
