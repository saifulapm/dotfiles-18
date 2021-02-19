local lualine = require('lualine')

-- LSP diagnostics api
local function lspStatus()
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
      local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
      local info_count = vim.lsp.diagnostic.get_count(0, 'Information') +  vim.lsp.diagnostic.get_count(0, 'Hint') 
      return ' ' .. error_count .. ' ' .. warning_count .. 'I: ' .. info_count
  else
      return ''
  end
end

-- Lualine configuration
lualine.options = {
    theme = 'onedark',
    separator = '|',
    icons_enabled = true,
}
lualine.sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'signify' },
    lualine_c = { 'filetype', 'filename', lspStatus },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
}
lualine.inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
}
-- Load lualine
lualine.status()
