return {
	-- telescope-file-browser.nvim --------------------------------------------
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
			-- To get telescope-file-browser loaded and working with telescope,
			-- you need to call load_extension, somewhere after setup function:
			require("telescope").load_extension "file_browser"
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
		end,
	}
}
