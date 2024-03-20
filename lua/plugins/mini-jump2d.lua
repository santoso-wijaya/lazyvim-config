return {
  "echasnovski/mini.jump2d",
  main = "mini.jump2d",
  version = "*",
  opts = {
    labels = "hklyuiopnm,qwertzxcvbasdgjf;",
    mappings = {
      start_jumping = "<Leader><Leader>",
    },
  },
  config = function(plugin, opts)
    require(plugin.main).setup(opts)
    vim.api.nvim_set_hl(0, "MiniJump2dSpot", {
      ctermfg = 1,
      fg = "Red",
      bold = true,
      undercurl = true,
      guibg = nil,
    })
  end,
}
