local saga = require 'lspsaga'

saga.init_lsp_saga {
    border_style = "round",
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {enable = true, sign = true, sign_priority = 20, virtual_text = true},
    code_action_keys = {quit = 'q', exec = '<CR>'},
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    }
}

local function dorename(win)
    local new_name = vim.trim(vim.fn.getline('.'))
    vim.api.nvim_win_close(win, true)
    vim.lsp.buf.rename(new_name)
end

local function rename()
    local opts = {relative = 'cursor', row = 0, col = 0, width = 30, height = 1, style = 'minimal', border = 'single'}
    local cword = vim.fn.expand('<cword>')
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)
    local fmt = '<cmd>lua Rename.dorename(%d)<CR>'

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {cword})
    vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win), {silent = true})
end

local themeColors = require('tokyonight.colors').setup()

local colors = {
    white = themeColors.fg_dark,
    bg = themeColors.bg,
    bg_highlight = themeColors.bg_highlight,
    blue = themeColors.blue,
    purple = themeColors.magenta,
    orange = themeColors.orange,
    hint = themeColors.teal,
    red = themeColors.red,
    diffAdd = themeColors.git.add,
    diffModified = themeColors.git.change,
    diffDeleted = themeColors.git.delete,
    info = themeColors.green2,
    error = themeColors.magenta2,
    warn = themeColors.orange,
    floatBorder = themeColors.border_highlight,
    selection_caret = themeColors.purple
}
local icons = {
    rounded_left_filled = '',
    rounded_right_filled = '',
    arrow_left_filled = '', -- e0b2
    arrow_right_filled = '', -- e0b0
    arrow_left = '', -- e0b3
    arrow_right = '', -- e0b1
    ghost = '',
    warn = '',
    info = '',
    error = '',
    hint = '',
    branch = '',
    file = '',
    dotdotdot = '…',
    information = '',
    symlink = '',
    line_number = '',
    git = {
        unstaged = '✗',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '★',
        deleted = '',
        ignored = '◌'
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = ''
    }
}

local function highlight(group, bg, fg, gui)
    if gui ~= nil and gui ~= '' then
        vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s gui=%s', group, bg, fg, gui))
    else
        vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s', group, bg, fg))
    end
end
local M = {}

local api = vim.api
local lsp = vim.lsp
local buf, win
local prompt_str = ' ' .. icons.folder.arrow_closed .. ' '

function M._rename()
    local newName = vim.trim(vim.fn.getline('.'):sub(5, -1))
    vim.cmd([[q!]])
    local params = lsp.util.make_position_params()
    local currName = vim.fn.expand('<cword>')
    if not (newName and #newName > 0) or newName == currName then return end
    params.newName = newName
    lsp.buf_request(0, 'textDocument/rename', params)
end
function M.rename()
    local map_opts = {noremap = true, silent = true}
    local opts = {style = 'minimal', border = 'single', relative = 'cursor', width = 25, height = 1, row = 1, col = 1}
    buf, win = api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    api.nvim_open_win(buf, true, opts)
    api.nvim_win_set_option(win, 'scrolloff', 0)
    api.nvim_win_set_option(win, 'sidescrolloff', 0)
    api.nvim_buf_set_option(buf, 'modifiable', true)
    api.nvim_buf_set_option(buf, 'buftype', 'prompt')
    api.nvim_buf_add_highlight(buf, -1, "LspRenamePrompt", 0, 0, #prompt_str)
    highlight('LspRenamePrompt', 'None', colors.selection_caret)

    vim.fn.prompt_setprompt(buf, prompt_str)

    vim.api.nvim_command('startinsert!')
    api.nvim_buf_set_keymap(buf, 'i', '<esc>', '<CMD>stopinsert <BAR> q!<CR>', map_opts)
    api.nvim_buf_set_keymap(buf, 'i', '<CR>', "<CMD>stopinsert <BAR> lua require('lsp-saga')._rename()<CR>", map_opts)

    function M._rename()
        local newName = vim.trim(vim.fn.getline('.'):sub(5, -1))
        vim.cmd([[q!]])
        local params = lsp.util.make_position_params()
        local currName = vim.fn.expand('<cword>')
        if not (newName and #newName > 0) or newName == currName then return end
        params.newName = newName
        lsp.buf_request(0, 'textDocument/rename', params)
    end
end

_G.Rename = {rename = M.rename, dorename = dorename}

vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua Rename.rename()<CR>', {silent = true})
return M
