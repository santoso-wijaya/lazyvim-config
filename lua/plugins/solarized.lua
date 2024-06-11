return {
  -- add Lua-scriptable solarized color scheme
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    name = "solarized",
    main = "solarized",
    priority = 1000,
    -- See: https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-customizing-plugin-specs
    opts = {
      -- See: https://github.com/maxmx03/solarized.nvim/blob/main/lua/solarized/palette.lua
      palette = "selenized",
      -- See: https://github.com/maxmx03/solarized.nvim?tab=readme-ov-file#default-config
      styles = {
        keywords = { bold = false },
      },
      enables = {
        -- For indentblankline ("ibl"), the default highlight colors that comes
        -- with this colorscheme is too dark for my taste; tweak in the
        -- `highlights` table below.
        indentblankline = false,
      },
      highlights = function(colors)
        -- TODO: Remove snippets lines 25-37 below once PR(#82) is merged.
        -- https://github.com/maxmx03/solarized.nvim/pull/82
        local colortool = require("solarized.utils.colors")
        local darken = colortool.darken
        local lighten = colortool.lighten

        local lsp_inlay_hint_fg
        if vim.o.background == "dark" then
          lsp_inlay_hint_fg = darken(colors.base01, 30)
        else
          lsp_inlay_hint_fg = lighten(colors.base01, 30)
        end

        return {
          LspInlayHint = { fg = lsp_inlay_hint_fg },
          -- Highlight of indent character.
          IblIndent = { fg = colors.base01, nocombine = true },
          -- Highlight of indent character when base of current context.
          IblScope = { fg = colors.base02, nocombine = true },
        }
      end,
    },
    config = function(plugin, opts)
      vim.o.background = "light"
      require(plugin.main).setup(opts)
      vim.cmd.colorscheme = "solarized"
    end,
  },

  -- configure LazyVim to load solarized
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
