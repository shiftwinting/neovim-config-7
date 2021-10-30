require'bufferline'.setup {
    options = {
        view = "multiwindow",
        numbers = "none" or "ordinal" or "buffer_id" or "both",
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        indicator_icon = '',
        max_name_length = 19,
        max_prefix_length = 19, -- prefix used when a buffer is deduplicated
        tab_size = 20,
        diagnostics = false,
        diagnostics_indicator = function(count, level, diagnostics_dict)
            return "(" .. count .. ")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then return true end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then return true end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then return true end
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { 'or', 'or' }
        separator_style = "thin",
        enforce_regular_tabs = false or true,
        always_show_bufferline = true or false,
        sort_by = 'extension' or 'relative_directory' or 'directory' or function(buffer_a, buffer_b)
            -- add custom logic
            return buffer_a.modified > buffer_b.modified
        end
    }
}
vim.cmd("nnoremap <silent> gb :BufferLinePick<CR>")
-- require("tabby").setup({tabline = require("tabby.presets").tab_with_top_win})
-- vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", {noremap = true})
-- -- move current tab to previous position
-- vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", {noremap = true})
-- -- move current tab to next position

-- vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", {noremap = true})
