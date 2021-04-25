require'bufferline'.setup{
  options = {
    view = "multiwindow" or "default",
    numbers = "none" or "ordinal" or "buffer_id" or "both",
    number_style = "superscript" or "" or { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    mappings = true or false,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = false or "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    show_buffer_close_icons = true or false,
    show_close_icon = true or false,
    show_tab_indicators = true or false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { 'or', 'or' }
    separator_style = "slant" or "thick" or "thin" or { 'any', 'any' },
    enforce_regular_tabs = false or true,
    always_show_bufferline = true or false,
    sort_by = 'extension' or 'relative_directory' or 'directory' or function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.modified > buffer_b.modified
    end
  }
}
