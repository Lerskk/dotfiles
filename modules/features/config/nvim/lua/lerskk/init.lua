require "lerskk.core.options"
require "lerskk.core.keymaps"

local plugins = {
  "telescope",
}

for _, plugin in ipairs(plugins) do
  require("lerskk.plugins." .. plugin)
end
