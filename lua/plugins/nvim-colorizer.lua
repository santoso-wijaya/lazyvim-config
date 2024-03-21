-- Commands (for filetypes that aren't hooked in AutoCmd)
-- * :ColorizerAttachToBuffer
-- * :ColorizerDetachFromBuffer
-- * :ColorizerToggle
return {
  "norcalli/nvim-colorizer.lua",
  opts = {
    "*",
    css = { css_fn = true },
    html = { names = false },
  },
}
