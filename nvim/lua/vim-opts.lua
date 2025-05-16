-- cmds --

vim.cmd("set expandtab")
vim.cmd("set nu")
vim.cmd("set relativenumber")
vim.cmd("set scrolloff=8")
vim.cmd("set shiftwidth=2")
vim.cmd("set smartindent")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")
vim.cmd("set termguicolors")
vim.g.markdown_folding = 1



-- map leaders --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.tinted_background_transparent = 1



-- keymaps --

vim.keymap.set("n", "<Tab>", function()
  local line = vim.fn.line(".")
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.INFO)
  else
    vim.cmd("normal! za")
  end
end, { desc = "[P]Toggle fold" })
