return {
  'glepnir/template.nvim',
  cmd = {'Template','TemProject'},
  config = function()
    require('template').setup({
      temp_dir = '~/.config/nvim/templates/',
      author = 'Carlos J. Torres',
      email = 'vlaadbrain@gmail.com',
    })
    require('template').register('{{_camel_file_no_last_}}', function(_)
		local original_file_name = vim.fn.expand("%:t:r")
		local file_name = original_file_name:match("(.*)_[^_]*$")
		local camel_case_file_name = ""
		local up_next = true
		for i = 1, #file_name do
			local char = file_name:sub(i, i)
			if char == "_" then
				up_next = true
			elseif up_next then
				camel_case_file_name = camel_case_file_name .. string.upper(char)
				up_next = false
			else
				camel_case_file_name = camel_case_file_name .. char
			end
		end
		return camel_case_file_name
  end)
end}
