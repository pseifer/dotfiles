-- Simple, automatic session handling.
-- Starting 'nvim' without args creates or attaches to session,
-- based on the current working directory.

return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "error",
			-- Exlcude the following projects.
			-- Note: Does *not* ignore subprojects.
			auto_session_suppress_dirs = {
				"/",
				"~/",
				"~/Projects",
				"~/Downloads",
				"~/Documents",
				"~/Teaching",
				"~/Notes",
				"~/Slides",
				"~/Papers",
			},
		})
	end,
}
