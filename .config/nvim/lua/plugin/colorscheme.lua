local ok, color = pcall(require, 'github-theme')

if not ok then
	return
end

color.setup()
