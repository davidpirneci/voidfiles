-- Ember Ridge: warm dusk palette, matches foot.ini / sway / fuzzel.
-- vim.g.ember_ridge_transparent = false  -> solid background instead of foot's alpha

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "ember-ridge"

local c = {
	bg = "#141516", -- charcoal (foot background)
	bg1 = "#1b1c1e", -- cursorline, floats
	bg2 = "#232427", -- popups, statusline
	bg3 = "#2d2e31", -- borders, surfaces (regular0)
	sel = "#474042", -- selection (foot selection-background)
	grey = "#5d5f63", -- line numbers, non-text (bright0)
	slate = "#6b7680", -- comments
	fg_dim = "#c9bdb3", -- regular7
	fg = "#e2d3c6", -- warm snow
	fg_hi = "#f1e6dc", -- bright7

	peach = "#e99b65", -- accent
	red = "#d0705a", -- terracotta
	red_b = "#e88a72",
	green = "#9aa979", -- sage
	green_b = "#b4c290",
	amber = "#e9a35f",
	amber_b = "#f3bc82",
	blue = "#7a96ad",
	blue_b = "#97b1c6",
	mauve = "#b88294",
	mauve_b = "#d29db0",
	teal = "#7fa6a3",
	teal_b = "#9cc2bf",

	diff_add = "#232b22",
	diff_del = "#2e1f1c",
	diff_chg = "#1f252b",
	diff_txt = "#2b3540",
	search = "#4a3a2b",
}

local transparent = vim.g.ember_ridge_transparent ~= false
local bg = transparent and "NONE" or c.bg

local hl = function(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

local groups = {
	-- editor ---------------------------------------------------------------
	Normal = { fg = c.fg, bg = bg },
	NormalNC = { fg = c.fg, bg = bg },
	NormalFloat = { fg = c.fg, bg = c.bg1 },
	FloatBorder = { fg = c.bg3, bg = c.bg1 },
	FloatTitle = { fg = c.peach, bg = c.bg1, bold = true },
	FloatFooter = { fg = c.slate, bg = c.bg1 },
	EndOfBuffer = { fg = c.bg, bg = bg },
	SignColumn = { bg = bg },
	FoldColumn = { fg = c.grey, bg = bg },
	Folded = { fg = c.slate, bg = c.bg1 },
	LineNr = { fg = c.grey },
	LineNrAbove = { link = "LineNr" },
	LineNrBelow = { link = "LineNr" },
	CursorLineNr = { fg = c.peach, bold = true },
	CursorLine = { bg = c.bg1 },
	CursorColumn = { bg = c.bg1 },
	ColorColumn = { bg = c.bg1 },
	Cursor = { fg = c.bg, bg = c.fg },
	lCursor = { link = "Cursor" },
	TermCursor = { fg = c.bg, bg = c.peach },
	Visual = { bg = c.sel },
	VisualNOS = { bg = c.sel },
	Search = { fg = c.amber_b, bg = c.search },
	CurSearch = { fg = c.bg, bg = c.peach, bold = true },
	IncSearch = { link = "CurSearch" },
	Substitute = { fg = c.bg, bg = c.red },
	MatchParen = { fg = c.peach, bg = c.bg3, bold = true },
	NonText = { fg = c.bg3 },
	Whitespace = { fg = c.bg3 },
	SpecialKey = { fg = c.grey },
	Conceal = { fg = c.slate },
	WinSeparator = { fg = c.bg3, bg = bg },
	VertSplit = { link = "WinSeparator" },
	Title = { fg = c.peach, bold = true },
	Directory = { fg = c.blue_b },
	Question = { fg = c.green },
	MoreMsg = { fg = c.green },
	ModeMsg = { fg = c.fg_dim },
	MsgArea = { fg = c.fg },
	ErrorMsg = { fg = c.red_b },
	WarningMsg = { fg = c.amber },
	WildMenu = { fg = c.bg, bg = c.peach },
	QuickFixLine = { bg = c.bg2, bold = true },

	StatusLine = { fg = c.fg_dim, bg = transparent and "NONE" or c.bg2 },
	StatusLineNC = { fg = c.grey, bg = transparent and "NONE" or c.bg1 },
	TabLine = { fg = c.slate, bg = bg },
	TabLineFill = { fg = c.slate, bg = bg },
	TabLineSel = { fg = c.fg, bg = c.bg2, bold = true },
	WinBar = { fg = c.fg_dim, bg = bg },
	WinBarNC = { fg = c.grey, bg = bg },

	Pmenu = { fg = c.fg, bg = c.bg2 },
	PmenuSel = { fg = c.fg_hi, bg = c.sel, bold = true },
	PmenuSbar = { bg = c.bg2 },
	PmenuThumb = { bg = c.grey },
	PmenuKind = { fg = c.teal, bg = c.bg2 },
	PmenuExtra = { fg = c.slate, bg = c.bg2 },

	SpellBad = { undercurl = true, sp = c.red },
	SpellCap = { undercurl = true, sp = c.amber },
	SpellLocal = { undercurl = true, sp = c.teal },
	SpellRare = { undercurl = true, sp = c.mauve },

	DiffAdd = { bg = c.diff_add },
	DiffDelete = { fg = c.red, bg = c.diff_del },
	DiffChange = { bg = c.diff_chg },
	DiffText = { bg = c.diff_txt },
	Added = { fg = c.green },
	Changed = { fg = c.blue },
	Removed = { fg = c.red },
	diffAdded = { link = "Added" },
	diffChanged = { link = "Changed" },
	diffRemoved = { link = "Removed" },

	-- syntax ---------------------------------------------------------------
	Comment = { fg = c.slate, italic = true },
	Constant = { fg = c.red_b },
	String = { fg = c.green },
	Character = { fg = c.green_b },
	Number = { fg = c.red_b },
	Float = { link = "Number" },
	Boolean = { fg = c.red_b },
	Identifier = { fg = c.fg },
	Function = { fg = c.blue_b },
	Statement = { fg = c.mauve },
	Conditional = { fg = c.mauve },
	Repeat = { fg = c.mauve },
	Label = { fg = c.mauve },
	Operator = { fg = c.fg_dim },
	Keyword = { fg = c.mauve },
	Exception = { fg = c.mauve },
	PreProc = { fg = c.red },
	Include = { fg = c.red },
	Define = { fg = c.red },
	Macro = { fg = c.amber },
	PreCondit = { fg = c.red },
	Type = { fg = c.teal_b },
	StorageClass = { fg = c.mauve },
	Structure = { fg = c.teal_b },
	Typedef = { fg = c.teal_b },
	Special = { fg = c.amber_b },
	SpecialChar = { fg = c.amber_b },
	Tag = { fg = c.peach },
	Delimiter = { fg = c.fg_dim },
	SpecialComment = { fg = c.slate, bold = true },
	Debug = { fg = c.red },
	Underlined = { underline = true },
	Ignore = { fg = c.grey },
	Error = { fg = c.red_b },
	Todo = { fg = c.bg, bg = c.amber, bold = true },

	-- treesitter -----------------------------------------------------------
	["@variable"] = { fg = c.fg },
	["@variable.builtin"] = { fg = c.peach, italic = true }, -- self, this
	["@variable.parameter"] = { fg = c.amber_b },
	["@variable.member"] = { fg = c.fg_dim },
	["@property"] = { fg = c.fg_dim },
	["@constant"] = { fg = c.red_b },
	["@constant.builtin"] = { fg = c.red_b, italic = true }, -- None, NULL, true
	["@constant.macro"] = { fg = c.amber },
	["@module"] = { fg = c.blue },
	["@label"] = { fg = c.mauve },
	["@string"] = { link = "String" },
	["@string.escape"] = { fg = c.amber_b },
	["@string.regexp"] = { fg = c.amber_b },
	["@string.special"] = { fg = c.amber_b },
	["@string.documentation"] = { fg = c.green, italic = true },
	["@character"] = { link = "Character" },
	["@number"] = { link = "Number" },
	["@boolean"] = { link = "Boolean" },
	["@type"] = { link = "Type" },
	["@type.builtin"] = { fg = c.teal },
	["@type.definition"] = { fg = c.teal_b },
	["@attribute"] = { fg = c.amber },
	["@function"] = { link = "Function" },
	["@function.builtin"] = { fg = c.peach },
	["@function.call"] = { fg = c.blue_b },
	["@function.macro"] = { fg = c.amber },
	["@function.method"] = { fg = c.blue_b },
	["@function.method.call"] = { fg = c.blue_b },
	["@constructor"] = { fg = c.teal_b },
	["@operator"] = { link = "Operator" },
	["@keyword"] = { link = "Keyword" },
	["@keyword.function"] = { fg = c.mauve },
	["@keyword.return"] = { fg = c.mauve, italic = true },
	["@keyword.import"] = { fg = c.red },
	["@keyword.directive"] = { fg = c.red },
	["@keyword.exception"] = { fg = c.mauve },
	["@keyword.operator"] = { fg = c.mauve },
	["@punctuation.delimiter"] = { fg = c.fg_dim },
	["@punctuation.bracket"] = { fg = c.fg_dim },
	["@punctuation.special"] = { fg = c.peach },
	["@comment"] = { link = "Comment" },
	["@comment.todo"] = { link = "Todo" },
	["@comment.note"] = { fg = c.bg, bg = c.teal, bold = true },
	["@comment.warning"] = { fg = c.bg, bg = c.amber, bold = true },
	["@comment.error"] = { fg = c.bg, bg = c.red, bold = true },
	["@tag"] = { fg = c.peach },
	["@tag.attribute"] = { fg = c.amber_b },
	["@tag.delimiter"] = { fg = c.grey },
	["@markup.heading"] = { fg = c.peach, bold = true },
	["@markup.heading.2"] = { fg = c.amber, bold = true },
	["@markup.heading.3"] = { fg = c.teal_b, bold = true },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.link"] = { fg = c.blue_b },
	["@markup.link.url"] = { fg = c.blue, underline = true },
	["@markup.raw"] = { fg = c.green },
	["@markup.list"] = { fg = c.peach },
	["@markup.quote"] = { fg = c.slate, italic = true },
	["@diff.plus"] = { link = "Added" },
	["@diff.minus"] = { link = "Removed" },
	["@diff.delta"] = { link = "Changed" },

	-- LSP semantic tokens (keep them in line with treesitter)
	["@lsp.type.namespace"] = { link = "@module" },
	["@lsp.type.parameter"] = { link = "@variable.parameter" },
	["@lsp.type.property"] = { link = "@property" },
	["@lsp.type.macro"] = { link = "@constant.macro" },
	["@lsp.type.enumMember"] = { link = "@constant" },
	["@lsp.mod.readonly"] = {},
	["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
	LspReferenceText = { bg = c.bg3 },
	LspReferenceRead = { bg = c.bg3 },
	LspReferenceWrite = { bg = c.bg3, underline = true },
	LspInlayHint = { fg = c.grey, italic = true },
	LspSignatureActiveParameter = { fg = c.peach, bold = true },
	LspInfoBorder = { link = "FloatBorder" },

	-- diagnostics
	DiagnosticError = { fg = c.red_b },
	DiagnosticWarn = { fg = c.amber },
	DiagnosticInfo = { fg = c.blue_b },
	DiagnosticHint = { fg = c.teal },
	DiagnosticOk = { fg = c.green },
	DiagnosticUnderlineError = { undercurl = true, sp = c.red_b },
	DiagnosticUnderlineWarn = { undercurl = true, sp = c.amber },
	DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue_b },
	DiagnosticUnderlineHint = { undercurl = true, sp = c.teal },
	DiagnosticVirtualTextError = { fg = c.red, italic = true },
	DiagnosticVirtualTextWarn = { fg = c.amber, italic = true },
	DiagnosticVirtualTextInfo = { fg = c.blue, italic = true },
	DiagnosticVirtualTextHint = { fg = c.teal, italic = true },
	DiagnosticUnnecessary = { fg = c.grey },

	-- plugins --------------------------------------------------------------
	-- blink.cmp
	BlinkCmpMenu = { link = "Pmenu" },
	BlinkCmpMenuBorder = { fg = c.bg3, bg = c.bg2 },
	BlinkCmpMenuSelection = { link = "PmenuSel" },
	BlinkCmpLabelMatch = { fg = c.peach, bold = true },
	BlinkCmpLabelDeprecated = { fg = c.grey, strikethrough = true },
	BlinkCmpKind = { fg = c.teal },
	BlinkCmpSource = { fg = c.grey },
	BlinkCmpDoc = { link = "NormalFloat" },
	BlinkCmpDocBorder = { link = "FloatBorder" },
	BlinkCmpSignatureHelp = { link = "NormalFloat" },
	BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
	BlinkCmpGhostText = { fg = c.grey, italic = true },

	-- fzf-lua
	FzfLuaNormal = { link = "NormalFloat" },
	FzfLuaBorder = { link = "FloatBorder" },
	FzfLuaTitle = { link = "FloatTitle" },
	FzfLuaCursorLine = { bg = c.bg3 },
	FzfLuaSearch = { fg = c.peach, bold = true },
	FzfLuaHeaderText = { fg = c.amber },
	FzfLuaPathLineNr = { fg = c.teal },
	FzfLuaBufFlagCur = { fg = c.peach },

	-- nvim-tree
	NvimTreeNormal = { fg = c.fg_dim, bg = bg },
	NvimTreeNormalNC = { fg = c.fg_dim, bg = bg },
	NvimTreeEndOfBuffer = { bg = bg },
	NvimTreeSignColumn = { bg = bg },
	NvimTreeWinSeparator = { fg = c.bg3, bg = bg },
	NvimTreeRootFolder = { fg = c.peach, bold = true },
	NvimTreeFolderName = { fg = c.blue_b },
	NvimTreeOpenedFolderName = { fg = c.blue_b, bold = true },
	NvimTreeEmptyFolderName = { fg = c.slate },
	NvimTreeFolderIcon = { fg = c.blue },
	NvimTreeIndentMarker = { fg = c.bg3 },
	NvimTreeGitDirty = { fg = c.amber },
	NvimTreeGitNew = { fg = c.green },
	NvimTreeGitDeleted = { fg = c.red },
	NvimTreeSpecialFile = { fg = c.peach, underline = true },
	NvimTreeCursorLine = { bg = c.bg1 },

	-- mini.nvim
	MiniDiffSignAdd = { fg = c.green },
	MiniDiffSignChange = { fg = c.blue },
	MiniDiffSignDelete = { fg = c.red },
	MiniDiffOverAdd = { link = "DiffAdd" },
	MiniDiffOverChange = { link = "DiffText" },
	MiniDiffOverContext = { link = "DiffChange" },
	MiniDiffOverDelete = { link = "DiffDelete" },
	MiniIndentscopeSymbol = { fg = c.grey },
	MiniCursorword = { bg = c.bg3 },
	MiniCursorwordCurrent = { bg = c.bg3 },
	MiniTrailspace = { bg = c.red },
	MiniClueBorder = { link = "FloatBorder" },
	MiniClueTitle = { link = "FloatTitle" },
	MiniClueDescGroup = { fg = c.peach },
	MiniClueDescSingle = { fg = c.fg },
	MiniClueNextKey = { fg = c.amber_b, bold = true },
	MiniClueNextKeyWithPostkeys = { fg = c.red_b, bold = true },
	MiniClueSeparator = { fg = c.grey },
	MiniNotifyNormal = { link = "NormalFloat" },
	MiniNotifyBorder = { link = "FloatBorder" },
	MiniNotifyTitle = { link = "FloatTitle" },
	MiniIconsAzure = { fg = c.blue_b },
	MiniIconsBlue = { fg = c.blue },
	MiniIconsCyan = { fg = c.teal_b },
	MiniIconsGreen = { fg = c.green },
	MiniIconsGrey = { fg = c.fg_dim },
	MiniIconsOrange = { fg = c.peach },
	MiniIconsPurple = { fg = c.mauve },
	MiniIconsRed = { fg = c.red },
	MiniIconsYellow = { fg = c.amber },

	-- floating terminal from init.lua
	FloatingTermNormal = { fg = c.fg, bg = bg },
	FloatingTermBorder = { fg = c.slate, bg = bg },

	-- mason
	MasonHeader = { fg = c.bg, bg = c.peach, bold = true },
	MasonHighlight = { fg = c.blue_b },
	MasonHighlightBlock = { fg = c.bg, bg = c.teal },
	MasonHighlightBlockBold = { fg = c.bg, bg = c.peach, bold = true },
	MasonMuted = { fg = c.slate },
	MasonMutedBlock = { fg = c.fg_dim, bg = c.bg3 },
}

for group, spec in pairs(groups) do
	hl(group, spec)
end

-- built-in :terminal uses the same 16 colors as foot
local term = {
	"#2d2e31", c.red, c.green, c.amber, c.blue, c.mauve, c.teal, c.fg_dim,
	c.grey, c.red_b, c.green_b, c.amber_b, c.blue_b, c.mauve_b, c.teal_b, c.fg_hi,
}
for i, col in ipairs(term) do
	vim.g["terminal_color_" .. (i - 1)] = col
end

-- shared with the lualine theme
package.loaded["ember-ridge.palette"] = c
