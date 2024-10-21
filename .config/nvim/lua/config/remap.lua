vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected line up

vim.keymap.set("n", "J", "mzJ`z") -- delete the line below
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down but centered
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up but centered
vim.keymap.set("n", "n", "nzzzv") -- Center when forward searching
vim.keymap.set("n", "N", "Nzzzv") -- Center when backward searching

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- replace current word with yanked
vim.keymap.set("n", "<leader>y", "viwp<CR>")
-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the current word with the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- local toggle_search_mode = false
-- vim.keymap.set("n", "<leader>k", function()
-- 	if toggle_search_mode then
-- 		vim.cmd("nohl")
-- 		toggle_search_mode = false
-- 	else
-- 		vim.cmd("/" .. vim.fn.expand("<cword>"))
-- 		vim.cmd("normal! N")
-- 		toggle_search_mode = true
-- 	end
-- end)

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>o", ":noh<CR>")

local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

local h1 = vim.api.nvim_create_augroup("HighlightHover", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  command = "silent! lua vim.lsp.buf.document_highlight()",
  group = h1,
})
local h2 = vim.api.nvim_create_augroup("HighlightHoverI", { clear = true })
vim.api.nvim_create_autocmd("CursorHoldI", {
  command = "silent! lua vim.lsp.buf.document_highlight()",
  group = h2,
})
local h3 = vim.api.nvim_create_augroup("ClearHighlight", { clear = true })
vim.api.nvim_create_autocmd("CursorMoved", {
  command = "silent! lua vim.lsp.buf.clear_references()",
  group = h3,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex" },
	command = "lua TexSettings()",
})
function TexSettings()
    -- vim.opt_local.textwidth = 0
    -- vim.opt_local.wrapmargin = 0
    vim.opt.wrap = true  -- wrap lines
    vim.opt.linebreak = true  -- breaks by word rather than character
    -- vim.opt.columns = 80
end


vim.keymap.set("n", "<leader>tc", function()
  local git_root = vim.fn.system("git rev-parse --show-toplevel")
  git_root = vim.fn.trim(git_root) -- Trim any trailing newline
  local env_file = git_root .. "/.env"

  -- Open the .env file
  vim.cmd("edit " .. env_file)
end)
