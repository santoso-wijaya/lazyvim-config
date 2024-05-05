return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        -- List of rules: https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md#rules
        markdownlint = {
          args = { "--disable", "MD033", "--" }, -- Disable "no inline HTML" rule
        },
      },
    },
  },
}
