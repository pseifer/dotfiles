return {
	"Pocco81/true-zen.nvim",
	config = function()
		 require("true-zen").setup( {
			-- your config goes here
			-- or just leave it empty :)

    integrations = {
        lualine = true, -- hide nvim-lualine (ataraxis)
      },
    })
  end,
}
