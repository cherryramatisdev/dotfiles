local ok, color = pcall(require, "colorbuddy")

if not ok then
  return
end

color.colorscheme "gruvbuddy"
