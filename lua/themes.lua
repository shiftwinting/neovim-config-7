-- material gruvbox
-- local embark = {
--     bg_dark = "#1d2021",
--     bg = "#2E3440",
--     space2 = "#2D2B40",
--     space3 = "#3E3859",
--     space4 = "#585273",
--     fg_dark = "#D8DEE9",
--     fg = "#ECEFF4",
--     red = "#ea6862",
--     dark_red = "#F02E6E",
--     green = "#a9b665",
--     dark_green = "#62d196",
--     yellow = "#d8a657",
--     dark_yellow = "#D08770",
--     blue = "#7daea3",
--     dark_blue = "#7daea3",
--     purple = "#d3869b",
--     dark_purple = "#d3869b",
--     cyan = "#89b482",
--     dark_cyan = "#7d9ea3"
-- }

-- everforest
local embark = {
    bg_dark = "#2b3339",
    bg = "#4c555b",
    space2 = "#323c41",
    space3 = "#3E3859",
    space4 = "#585273",
    fg_dark = "#D8DEE9",
    fg = "#ECEFF4",
    red = "#e67e80",
    dark_red = "#e67e80",
    green = "#a7c080",
    dark_green = "#83c092",
    yellow = "#dbbc7f",
    dark_yellow = "#e69875",
    blue = "#7fbbb3",
    dark_blue = "#7fbbb3",
    purple = "#d699b6",
    dark_purple = "#d699b6",
    cyan = "#83c092",
    dark_cyan = "#7d9ea3"
}

local embark = {
    bg_dark = "#24283b",
    bg = "#1f2335",
    space2 = "#323c41",
    space3 = "#3E3859",
    space4 = "#585273",
    fg_dark = "#D8DEE9",
    fg = "#ECEFF4",
    red = "#f7768e",
    dark_red = "#f7768e",
    green = "#9ece6a",
    dark_green = "#9ece6a",
    yellow = "#dbbc7f",
    dark_yellow = "#e69875",
    blue = "#7aa2f7",
    dark_blue = "#7aa2f7",
    purple = "#bb9af7",
    dark_purple = "#bb9af7",
    cyan = "#2ac3de",
    dark_cyan = "#7d9ea3"
}

local themes = {embark = embark}


local get_theme = function()
    theme = themes[os.getenv("THEME")] or embark
    return theme
end

return {get_theme = get_theme}
