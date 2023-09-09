

local colors_name = "gruvbones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette
if bg == "light" then
	palette = util.palette_extend({
		bg = hsluv "#fbf1c7",
		fg = hsluv "#3c3836",
		rose = hsluv "#9d0006",
		leaf = hsluv "#79740e",
		wood = hsluv "#b57614",
		water = hsluv "#076678",
		blossom = hsluv "#8f3f71",
		sky = hsluv "#427b58",
	}, bg)
else
	palette = util.palette_extend({
		bg = hsluv "#282828",
		fg = hsluv "#ebdbb2",
		rose = hsluv "#fb4934",
		leaf = hsluv "#b8bb26",
		wood = hsluv "#fabd2f",
		water = hsluv "#83a598",
		blossom = hsluv "#d3869b",
		sky = hsluv "#83c07c",
	}, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
		Statement { base_specs.Statement, fg = palette.rose },
		Special { fg = palette.water },
		Type { fg = palette.sky, gui = "italic" },
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
--
require("zenbones.term").apply_colors(palette)

vim.g.duckbones_darkness = "stark"
vim.g.duckbones_transparent_background = true

vim.g.zenburned_darkness = "stark"
vim.g.zenburned_transparent_background = true

vim.g.forestbones_darkness = "stark"
vim.g.forestbones_transparent_background = true

vim.g.neobones_darkness = "stark"
vim.g.neobones_transparent_background = false

vim.g.rosebones_darkness = "stark"
vim.g.rosebones_transparent_background = true

vim.g.zenwritten_darkness = "stark"
vim.g.zenwritten_transparent_background = true

vim.g.nordbones_darkness = "stark"
vim.g.nordbones_transparent_background = true
-- vim.g.gruvbones_darkness = "stark"
-- vim.g.gruvbones_transparent_background = true


vim.cmd([[colorscheme neobones]])



