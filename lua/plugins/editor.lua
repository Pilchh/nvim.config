return {
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
			},
		},
	},
	{ "NMAC427/guess-indent.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.o.timeoutlen
			delay = 500,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			spec = {
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
	},
	{
		"vague-theme/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup({
				plugins = {
					telescope = {
						match = "bold",
					},
				},
			})

			vim.cmd.colorscheme("vague")

			local telescope_bg = "#171718"

			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = telescope_bg })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = telescope_bg })
			vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = telescope_bg })
			vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = telescope_bg })

			vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = telescope_bg, bg = telescope_bg })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = telescope_bg, bg = telescope_bg })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = telescope_bg, bg = telescope_bg })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = telescope_bg, bg = telescope_bg })

			-- Base background for dropdown
			local dark_bg = "#171718"

			-- Your palette
			local colors = {
				func = "#c48282",
				property = "#c3c3d5",
				type = "#9bb4bc",
				constant = "#aeaed1",
				number = "#e0a363",
				string = "#e8b589",
				parameter = "#bb9dbd",
				keyword = "#6e94b2",
				operator = "#90a0b5",
				error = "#d8647e",
				warning = "#f3be7c",
				hint = "#7e98e8",
			}

			-- Main dropdown background
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = dark_bg, fg = "#cdcdcd" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = dark_bg, fg = dark_bg })

			-- Icon highlights (colored foregrounds, dark background)
			vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = colors.func, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = colors.property, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = colors.type, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { fg = colors.constant, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindNumber", { fg = colors.number, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindString", { fg = colors.string, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindParameter", { fg = colors.parameter, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = colors.keyword, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { fg = colors.operator, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindError", { fg = colors.error, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindWarning", { fg = colors.warning, bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpKindHint", { fg = colors.hint, bg = dark_bg })

			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = dark_bg, fg = dark_bg })

			vim.api.nvim_set_hl(0, "NormalFloat", { bg = dark_bg })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = dark_bg, fg = dark_bg })

			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = dark_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { bg = dark_bg, fg = dark_bg })
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
