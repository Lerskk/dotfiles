local M = {}
local p = require("formoun.palette")

local function cterm(hex)
  if not hex or hex == "NONE" then return nil end
  local r = tonumber(hex:sub(2,3), 16)
  local g = tonumber(hex:sub(4,5), 16)
  local b = tonumber(hex:sub(6,7), 16)

  return 16 + 36 * math.floor(r/51) + 6 * math.floor(g/51) + math.floor(b/51)
end

local function resolve(spec)
  if not spec then return {} end
  local out = {}
  for k, v in pairs(spec) do
    if k == "fg" or k == "bg" or k == "sp" then
      if type(v) == "string" and v:sub(1,1) == "#" then
        out[k] = v
        out["cterm" .. k] = cterm(v)
      elseif v == "NONE" or v == nil then

      else
        out[k] = v
      end
    else
      out[k] = v
    end
  end
  return out
end

function M.run(groups)
  for name, spec in pairs(groups) do
    if spec.link then
      vim.api.nvim_set_hl(0, name, { link = spec.link, default = spec.default or true })
    else
      vim.api.nvim_set_hl(0, name, resolve(spec))
    end
  end
end

return M
