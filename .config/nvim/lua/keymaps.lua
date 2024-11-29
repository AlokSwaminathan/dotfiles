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
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent dir in oil" })

vim.keymap.set("n", "+", "<CMD>Navbuddy<CR>", { desc = "Navigate on lsp symbols" })

vim.keymap.set("n", "z", "<Plug>(leap)")
vim.keymap.set("n", "Z", "<Plug>(leap-from-window)")
vim.keymap.set({ "x", "o" }, "z", "<Plug>(leap-forward)")
vim.keymap.set({ "x", "o" }, "Z", "<Plug>(leap-backward)")

vim.api.nvim_create_user_command("ClearClip", function()
  require("neoclip").clear_history()
end, { desc = "Clear neoclip history" })

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

local function paste_from_os_clip(before_cursor)
  local res = vim.system({ "wl-paste" }, { text = true }):wait()

  if res and res.stdout ~= "" then
    local clipboard = res.stdout:gsub("\0", ""):gsub("\n\n$", "")
    local clipboard_split = vim.split(clipboard, "\n")
    vim.api.nvim_put(clipboard_split, "c", not before_cursor, true)
  else
    print("OS Clipboard is empty or there was an error with wl-paste")
  end
end

vim.keymap.set("n", "<leader>p", function()
  paste_from_os_clip(false)
end, { noremap = true, silent = true, desc = "Paste from OS Clip" })

vim.keymap.set("n", "<leader>P", function()
  paste_from_os_clip(true)
end, { noremap = true, silent = true, desc = "Paste from OS Clip" })

vim.keymap.set("n", "<leader>rs", function()
  local reg = vim.v.register or '"'

  local res = vim.system({ "wl-paste" }, { text = true }):wait()

  if res and res.stdout ~= "" then
    local clipboard = res.stdout:gsub("\0", ""):gsub("\n\n$", "")
    vim.fn.setreg(reg, clipboard)
  else
    print("OS Clipboard is empty or there was an error with wl-paste")
  end
end, { noremap = true, silent = true, desc = "Save value from OS Clipboard to the specified register" })

vim.keymap.set("n", "<leader>nc", "<CMD>Telescope neoclip<CR>", { desc = "Look through nvim clipboard" })

vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<CMD>w<CR>", { desc = "Save file" })
