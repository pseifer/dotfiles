-- File for loading private data from outside the public config.

-- Loads and returns the first line of file_path.
local function load_private_file(file_path, row)
	-- Use pcall to safely call vim.fn.readfile
	local success, data = pcall(vim.fn.readfile, file_path)
	if success and data and #data >= row then
		return data[row]
	else
		print("Unable to load credentials: ", file_path)
	end
end

-- Credentials: LanguageTool
vim.g.language_tool_api_mail = load_private_file(vim.fn.expand("~/.credentials/languagetool"), 1)
vim.g.language_tool_api_key = load_private_file(vim.fn.expand("~/.credentials/languagetool"), 2)
