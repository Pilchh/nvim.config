vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local argv = vim.fn.argv()
		if #argv == 0 then
			return
		end

		local path = vim.fn.fnamemodify(argv[1], ":p")

		-- Handle Oil URIs like oil:///home/user/.config/nvim
		if path:match("^oil://") then
			path = path:gsub("^oil://", "")
		end

		local stat = vim.uv.fs_stat(path)
		if stat and stat.type == "directory" then
			vim.fn.chdir(path)
		end
	end,
})
