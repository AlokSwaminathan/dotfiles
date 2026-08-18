local M = {}

local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local files = vim.fn.readdir(plugins_dir)
for _, file in ipairs(files) do
  if file:match("%.lua") and file ~= "init.lua" then
    local plugin = require("plugins." .. file:match("(.+)%..+"))
    if type(plugin) == "table" then
      for _, v in pairs(plugin) do
        table.insert(M, v)
      end
    end
  end
end

return M
