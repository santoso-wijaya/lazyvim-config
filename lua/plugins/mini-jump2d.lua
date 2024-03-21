local set_minijump_hl = function()
  vim.api.nvim_set_hl(0, "MiniJump2dSpot", {
    ctermfg = 1,
    fg = "Red",
    italic = true,
    undercurl = true,
    guibg = nil,
  })
end

return {
  "echasnovski/mini.jump2d",
  main = "mini.jump2d",
  version = "*",
  opts = {
    labels = "hklyuiopnm,qwertzxcvbasdgjf;",
    dim = true,
    mappings = {
      start_jumping = "<Leader>j",
    },
  },
  config = function(plugin, opts)
    require(plugin.main).setup(opts)

    set_minijump_hl()
    -- Set up the highlight group for the jump spots as a colorscheme hook.
    -- Some NeoVim implementation like NeoVide may override this otherwise.
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = set_minijump_hl,
    })
  end,
}
