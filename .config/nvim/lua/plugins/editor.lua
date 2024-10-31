return {
	-- Telescope.nvim ---------------------------------------------------------
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- telescope-file-browser.nvim --------------------------------------------
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local fb_actions = require "telescope._extensions.file_browser.actions"
			require("telescope").setup({
				hidden = { file_browser = false },
				extensions={
					file_browser = {
						no_ignore = true,
						respect_gitignore = false,
						mappings = {
							["n"] = {
								["-"] = fb_actions.goto_parent_dir,
							},
						},
					}
				},
			})
			-- To get telescope-file-browser loaded and working with telescope,
			-- you need to call load_extension, somewhere after setup function:
			require("telescope").load_extension "file_browser"
			vim.keymap.set("n", "<leader>pv", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
		end,
	},
	{
		"3rd/image.nvim",
		config = function()
			require("image").setup {
				backend = "kitty",
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = true,
						filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
					},
					neorg = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = false,
						filetypes = { "norg" },
					},
					html = {
						enabled = false,
					},
					css = {
						enabled = false,
					},
				},
				max_width = nil,
				max_height = nil,
				max_width_window_percentage = nil,
				max_height_window_percentage = 50,
				window_overlap_clear_enabled = false,                                   -- toggles images when windows are overlapped
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
				editor_only_render_when_focused = false,                                -- auto show/hide images when the editor gains/looses focus
				tmux_show_only_in_active_window = false,                                -- auto show/hide images in the correct Tmux window (needs visual-activity off)
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
			}
		end
	}
}
