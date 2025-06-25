-- Plugin for using formatter with built in LSP.
-- Formatter are installed via Mason (see mason.lua).
-- Deprecated for stevearc/conform.nvim

return {}

-- return {
-- 	"mhartington/formatter.nvim",
-- 	config = function()
-- 		-- Setup formatters.
-- 		-- https://github.com/mhartington/formatter.nvim
-- 		require("formatter").setup({
-- 			filetype = {
-- 				python = {
-- 					require("formatter.filetypes.python").black,
-- 				},
-- 				lua = {
-- 					require("formatter.filetypes.lua").stylua,
-- 				},
-- 				sh = {
-- 					require("formatter.filetypes.sh").shfmt,
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
