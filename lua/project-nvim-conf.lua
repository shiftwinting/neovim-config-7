require("project_nvim").setup {}

-- For NVIM tree integration
vim.g.nvim_tree_respect_buf_cwd = 1

require('telescope').load_extension('projects')

