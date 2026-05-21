require "lerskk.core.options"
require "lerskk.core.keymaps"

local plugins = {
  "telescope",
}

for _, plugin in ipairs(plugins) do
  require("plugins." .. plugin)
end
