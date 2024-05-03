-- Git integration, featuring 'Fugitive' for git commands via ':Git ...'
-- and gitsigns, setup to highlight diff in number row.

return {
	{
		"tpope/vim-fugitive",
		config = function()
			Nmap("<leader>gg", vim.cmd.Git, "Fugitive")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				-- Only color numbers, instead of showing signs.
				signcolumn = false,
				numhl = true,
			})
			local wk = require("which-key")
			wk.register({
				g = {
					name = "git",
					B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle: Blame line" },
					b = { "<cmd>Gitsigns blame_line<cr>", "Blame current line" },
					s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
					r = { "<cmd>Gitsigns stage_hunk<cr>", "Rest hunk" },
					S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" },
					R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
					h = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle status signs" },
				},
			}, { prefix = "<leader>" })
			wk.register({
				g = {
					name = "git",
					s = { "<cmd>Gitsigns stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>", "Stage hunk" },
					r = { "<cmd>Gitsigns stage_hunk {vim.fn.line('.'), vim.fn.line('v')}<cr>", "Rest hunk" },
				},
			}, { mode = "v", prefix = "<leader>" })
		end,
	},
}
