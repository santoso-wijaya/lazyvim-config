return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        -- Disable rust-analyzer setup since it conflicts with mason's
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
