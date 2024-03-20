local HIGHLIGHTS = {
  { highlight = "RainbowRed", color = "#E06C75" },
  { highlight = "RainbowOrange", color = "#D19A66" },
  { highlight = "RainbowYellow", color = "#E5C07B" },
  { highlight = "RainbowGreen", color = "#98C379" },
  { highlight = "RainbowBlue", color = "#61AFEF" },
  { highlight = "RainbowCyan", color = "#56B6C2" },
  { highlight = "RainbowViolet", color = "#C678DD" },
}

local function get_highlight_names()
  local keyset = {}
  for i, highlight in pairs(HIGHLIGHTS) do
    keyset[i] = highlight.highlight
  end
  return keyset
end

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = { indent = { highlight = get_highlight_names() } },
  config = function(plugin, opts)
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      for _, highlight in pairs(HIGHLIGHTS) do
        vim.api.nvim_set_hl(0, highlight.highlight, { fg = highlight.color })
      end
    end)

    require(plugin.main).setup(opts)
  end,
}
