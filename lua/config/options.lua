-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.ruler = true
opt.colorcolumn = { 80, 120 }

-- Do not clutter the current directory with swap, backup, undo files.
opt.swapfile = true
opt.directory = ".swp/,~/.swp/,/tmp//"
opt.backupdir = ".backup/,~/.backup/,/tmp//"
opt.undodir = ".undo/,~/.undo/,/tmp//"

-- `vim.opt.list = true` in the default options. Customize what these invisible
-- characters are rendered with, so they don't distract us too much.
-- By using uncommon Unicode characters, they won't be mistaken for text content.
opt.listchars = {
  tab = "»-»",
  trail = "·",
  nbsp = "␣",
  extends = "▶",
  precedes = "◀",
}

vim.o.guifont = "MonaspiceNe Nerd Font,FiraCode Nerd Font,Monaspace Neon,Fira Code"

-- NeoVide specific settings
if vim.g.neovide then
  vim.g.neovide_theme = "auto" -- dark/light matches current system settings
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_remember_window_size = true

  -- Only enables IME in input mode and when searching, so that you can navigate
  -- normally (e.g. when typing Japanese)
  local function set_ime(args)
    if args.event:match("Enter$") then
      vim.g.neovide_input_ime = true
    else
      vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
  }) -- Put anything you want to happen only in Neovide here
end
