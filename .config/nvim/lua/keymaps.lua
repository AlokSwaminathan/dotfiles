vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Custom keymaps
vim.keymap.set("n", "<leader>y", function()
  local reg = vim.v.register or '"'

  local content = vim.fn.getreg(reg)
  if content == nil or content == "" then
    print('Register "' .. reg .. '" is empty')
    return
  end

  vim.fn.setreg("+", content)

  print('Copied from register "' .. reg .. '" to OS clipboard')
end, { noremap = true, silent = true, desc = "Copy from register to OS clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from OS Clip" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = true, silent = true, desc = "Paste from OS Clip" })

vim.keymap.set("n", "<leader>rs", function()
  local reg = vim.v.register or '"'
  local clipboard = vim.fn.getreg("+")
  vim.fn.setreg(reg, clipboard)
end, { noremap = true, silent = true, desc = "Save value from OS Clipboard to the specified register" })

vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<CMD>w<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "v" }, "<leader>q", "<Cmd>q<CR>", { desc = "Close view" })
