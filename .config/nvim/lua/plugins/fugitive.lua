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
			wk.add({
				{ "<leader>g", group = "git" },
				{ "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle: Blame line" },
				{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
				{ "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
				{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame current line" },
				{ "<leader>gh", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle status signs" },
				{ "<leader>gr", "<cmd>Gitsigns stage_hunk<cr>", desc = "Rest hunk" },
				{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
			})
		end,
	},
}
