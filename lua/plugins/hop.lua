return {
  -- `hop` is an EasyMotion-like plugin allowing you to jump anywhere in a
  -- document with as few keystrokes as possible.
  {
    "smoka7/hop.nvim",
    version = "*",
    main = "hop",
    opts = {
      keys = "hklyuiopnm,qwertzxcvbasdgjf;",
    },
    keys = {
      { "<leader>hw", "<cmd>HopWord<cr>", mode = "", desc = "Hop to all words in the visible buffer; most useful!" },
      { "<leader>hl", "<cmd>HopLine<cr>", mode = "", desc = "Hop to the first column of each visible line" },
      {
        "<leader>hs",
        "<cmd>HopLineStart<cr>",
        mode = "",
        desc = "Hop to the first non-whitespace character of each line",
      },
      {
        "<leader>hv",
        "<cmd>HopVertical<cr>",
        mode = "",
        desc = "Hop to each line, keeping cursor column position the same",
      },
      { "<leader>h/", "<cmd>HopPattern<cr>", desc = "Validate search (`/`) with hints" },
      { "<leader>ha", "<cmd>HopAnywhere<cr>", mode = "", desc = "Hop anywhere" },
    },
  },

  -- Register the `<leader>h` prefix as with a group name in which-key.
  {
    "folke/which-key.nvim",
    opts = {
      specs = {
        { "<leader>h", group = "hop" },
      },
    },
  },
}
