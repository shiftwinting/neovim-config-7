local condition = require('galaxyline.condition')
local testing = require('testing')
local gl = require('galaxyline')
local themes = require('themes')
local gps = require("nvim-gps")
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista_kind', 'dbui'}

local colors = themes.get_theme()

-- helper functions
local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end

local server_attached = function()
    return vim.lsp.buf_get_clients()[1] ~= nil
end

local active_lsp = function()
    active_client = vim.lsp.buf_get_clients()[1]
    if active_client ~= nil then return '鷺' .. active_client.name end

    return '鷺 N/A'
end

local testing_results = function()
    local test_colors = {passing = colors.blue, running = colors.yellow, failing = colors.red}

    vim.api.nvim_command('hi GalaxyTestResults guifg=' .. test_colors[testing.TESTING_STATUS])

    if testing.TESTING_STATUS == 'passing' then
        return "∙ PASS"
    elseif testing.TESTING_STATUS == 'running' then
        return "∙ CHECK"
    elseif testing.TESTING_STATUS == 'failing' then
        return "∙ FAIL"
    end
end

-----------------------------------------------------------
-- Bar Sections
-----------------------------------------------------------

-- LEFT
-----------------------------------------------------------
gls.left[1] = {
    leftRounded = {
        provider = function()
            return ""
        end,
        highlight = {colors.bg, colors.bg_dark}
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according to vim mode
            local mode_color = {
                n = colors.cyan,
                no = colors.cyan,
                s = colors.dark_yellow,
                S = colors.dark_yellow,
                i = colors.red,
                ic = colors.red,
                V = colors.yellow,
                v = colors.yellow,
                [""] = colors.dark_yellow,
                c = colors.purple,
                cv = colors.purple,
                ce = colors.purple,
                t = colors.green,
                r = colors.purple,
                R = colors.purple,
                Rv = colors.purple,
                ["!"] = colors.purple
            }

            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                v = 'VISUAL',
                [""] = 'V-BLOCK',
                V = 'V·LINE',
                c = 'COMMAND',
                r = 'REPLACE',
                R = 'REPLACE',
                Rv = 'V·REPLACE',
                t = 'TERM',
                ['!'] = 'SHELL'
            }

            local mode = vim.fn.mode();
            local color = mode_color[mode]
            local alias = alias[mode]
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)

            -- return '   ' .. alias
            return ' 異' .. alias
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.green, colors.bg, 'bold'}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg}
    }
}

gls.left[4] = {
    FileName = {
        provider = {'FileName'},
        condition = buffer_not_empty,
        highlight = {colors.green, colors.bg, 'bold'}
    }
}

gls.left[5]= {
	nvimGPS = {
    highlight = {colors.dark_cyan, colors.bg, 'bold'},
		provider = function()
			return gps.get_location()
		end,
		condition = function()
			return gps.is_available()
		end
	}
}

gls.left[6] = {
    teech = {
        provider = function()
            return ""
        end,
        separator = " ",
        highlight = {colors.bg, colors.bg_dark}
    }
}

-- RIGHT
-----------------------------------------------------------
gls.right[1] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.bg_dark}
    }
}

gls.right[2] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.blue, colors.bg_dark}
    }
}
gls.right[3] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.bg_dark}
    }
}

gls.right[4] = {
    leftRounded = {
        provider = function()
            return ""
        end,
        highlight = {colors.bg, colors.bg_dark}
    }
}
gls.right[5] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.astral0, colors.bg}
    }
}
gls.right[6] = {
    LanguageServer = {
        provider = active_lsp,
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.cyan, colors.bg}
    }
}

gls.right[7] = {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.purple, colors.bg}
    }
}

gls.right[8] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.purple, colors.bg},
        separator_highlight = {'NONE', colors.bg},
        separator = ' ',
    }
}

gls.right[9] = {
    teech = {
        provider = function()
            return ""
        end,
        highlight = {colors.bg, colors.bg_dark}
    }
}
-- SHORTLINE
-----------------------------------------------------------
gls.short_line_left[1] = {FileName = {provider = 'FileName', highlight = {colors.green, colors.bg_dark}}}
