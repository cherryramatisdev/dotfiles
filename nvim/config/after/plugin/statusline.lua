local generator = function()
  local el_segments = {}

  local extensions = require("el.extensions")
  table.insert(el_segments, extensions.mode)

  table.insert(el_segments, " ")

  table.insert(el_segments, "%f")

  table.insert(el_segments, "%=")

  table.insert(el_segments, "%y")

  return el_segments
end

-- And then when you're all done, just call
require("el").setup {generator = generator}
