local M = {}
function M.apply()
  local groups = require("formoun.groups")
  require("formoun.apply").run(groups)
end
return M
