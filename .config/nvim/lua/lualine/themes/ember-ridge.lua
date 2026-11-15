-- lualine theme for Ember Ridge (palette comes from colors/ember-ridge.lua)
local c = package.loaded["ember-ridge.palette"]
	or {
		bg1 = "#1b1c1e",
		bg2 = "#232427",
		bg3 = "#2d2e31",
		grey = "#5d5f63",
		fg_dim = "#c9bdb3",
		fg = "#e2d3c6",
		peach = "#e99b65",
		green = "#9aa979",
		blue_b = "#97b1c6",
		mauve = "#b88294",
		red = "#d0705a",
		bg = "#141516",
	}

local function mode(accent)
	return {
		a = { fg = c.bg, bg = accent, gui = "bold" },
		b = { fg = c.fg, bg = c.bg3 },
		c = { fg = c.fg_dim, bg = c.bg1 },
	}
end

return {
	normal = mode(c.peach),
	insert = mode(c.green),
	visual = mode(c.mauve),
	replace = mode(c.red),
	command = mode(c.blue_b),
	terminal = mode(c.green),
	inactive = {
		a = { fg = c.grey, bg = c.bg1 },
		b = { fg = c.grey, bg = c.bg1 },
		c = { fg = c.grey, bg = c.bg1 },
	},
}
