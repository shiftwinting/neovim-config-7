local embark = {
    bg_dark = "#1d2021",
    bg = "#2E3440",
    space2 = "#2D2B40",
    space3 = "#3E3859",
    space4 = "#585273",
    fg_dark = "#D8DEE9",
    fg = "#ECEFF4",
    red = "#ea6862",
    dark_red = "#F02E6E",
    green = "#a9b665",
    dark_green = "#62d196",
    yellow = "#d8a657",
    dark_yellow = "#D08770",
    blue = "#7daea3",
    dark_blue = "#7daea3",
    purple = "#d3869b",
    dark_purple = "#d3869b",
    cyan = "#89b482",
    dark_cyan = "#7d9ea3"
}

local themes = {embark = embark}

local get_theme = function()
    theme = themes[os.getenv("THEME")] or embark
    return theme
end

return {get_theme = get_theme}
