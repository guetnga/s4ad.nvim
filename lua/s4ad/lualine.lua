local c = require('s4ad.palette')
local function mode(accent)
  return {
    a = { fg = c.white, bg = accent, gui = 'bold' },
    b = { fg = c.blue_muted, bg = c.surface_alt },
    c = { fg = c.fg, bg = c.surface },
    x = { fg = c.fg, bg = c.surface },
    y = { fg = c.blue_muted, bg = c.surface_alt },
    z = { fg = c.white, bg = accent, gui = 'bold' },
  }
end
return {
  normal = mode(c.blue), insert = mode(c.green),
  visual = mode(c.purple), replace = mode(c.red),
  command = mode(c.yellow), terminal = mode(c.cyan),
  inactive = {
    a = { fg = c.muted, bg = c.surface },
    b = { fg = c.muted, bg = c.surface },
    c = { fg = c.muted, bg = c.surface },
  },
}
