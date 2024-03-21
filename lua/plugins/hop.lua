-- `hop` is an EasyMotion-like plugin allowing you to jump anywhere in a
-- document with as few keystrokes as possible.
return {
  "smoka7/hop.nvim",
  version = "*",
  main = "hop",
  opts = {
    keys = "hklyuiopnm,qwertzxcvbasdgjf;",
  },
  config = function(plugin, opts)
    local hop = require(plugin.main)
    hop.setup(opts)

    -- Hop doesn't set any keybindings; we will have to define them ourselves.
    local direction = require("hop.hint").HintDirection
    local keymap = vim.keymap

    -- Draw hints over the jump spots for `f`, `F`, `t`, and `T` vim verbs.
    local f_hints = { current_line_only = true }
    keymap.set("", "f", function()
      hop.hint_char1(vim.tbl_extend("force", f_hints, { direction = direction.AFTER_CURSOR }))
    end)
    keymap.set("", "F", function()
      hop.hint_char1(vim.tbl_extend("force", f_hints, { direction = direction.BEFORE_CURSOR }))
    end)
    -- `t` and `T` are like `f` and `F`, except that the jump would place the
    -- cursor _before_ the hinted positions.
    local t_hints = { current_line_only = true, hint_offset = -1 }
    keymap.set("", "t", function()
      hop.hint_char1(vim.tbl_extend("force", t_hints, { direction = direction.AFTER_CURSOR }))
    end)
    keymap.set("", "T", function()
      hop.hint_char1(vim.tbl_extend("force", t_hints, { direction = direction.BEFORE_CURSOR }))
    end)

    -- Now, let's map some keys to Hop commands.
    -- Command list: https://github.com/smoka7/hop.nvim/wiki/Commands
    --
    -- Register keybindings with `which-key` so that they also get helpful
    -- documentation when <leader> is pressed, in a window dressing.
    local wk = require("which-key")
    wk.register({
      h = {
        name = "hop", -- the group name; shows up in a window dressing
        -- <leader>hw => hints for all words in the buffer; most useful hop command!
        w = { "<cmd>HopWord<cr>", "Hints to hop to all words in the visible buffer; most useful!" },
        -- <leader>hl => hints for hopping to the beginning of any visible line
        l = { "<cmd>HopLine<cr>", "Hints to hop to the first column of each visible line" },
        s = { "<cmd>HopLineStart<cr>", "Hints to hop to the first non-whitespace character of each line" },
        v = { "<cmd>HopVertical<cr>", "Hints to hop to each line, keeping cursor column position the same" },
        -- <leader>h/ => enter search pattern => hints for hopping
        ["/"] = { "<cmd>HopPattern<cr>", "Validate search (`/`) with hints" },
        -- <leader>ha => hop anywhere
        a = { "<cmd>HopAnywhere<cr>", "Hop anywhere" },
      },
    }, { prefix = "<leader>" })
  end,
}
