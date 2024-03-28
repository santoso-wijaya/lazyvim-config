return {
  -- add Lua-scriptable solarized color scheme
  {
    "santoso-wijaya/solarized.nvim",
    lazy = false,
    name = "solarized",
    main = "solarized",
    priority = 1000,
    -- See: https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-customizing-plugin-specs
    opts = {
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
        return {
          -- Highlight of indent character.
          -- Use a more subdued background highlight hue (in the default dark mode base).
          IblIndent = { fg = colors.base02, nocombine = true },
          -- Highlight of indent character when base of current context.
          -- Use a more subdued comment hue (in the default dark mode base).
          -- Note that the base is in the default dark mode; it will be flipped in light mode.
          IblScope = { fg = colors.base01, nocombine = true },
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
