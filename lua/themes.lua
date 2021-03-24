local embark = {
  bg_dark = "#3B4252",
  bg = "#2E3440",
  space2 = "#2D2B40",
  space3 = "#3E3859",
  space4 = "#585273",
  fg_dark ="#D8DEE9",
  fg ="#ECEFF4",
  red = "#BF616A",
  dark_red = "#F02E6E",
  green = "#A1EFD3",
  dark_green = "#62d196",
  yellow = "#EBCB8B",
  dark_yellow = "#D08770",
  blue = "#81A1C1",
  dark_blue = "#81A1C1",
  purple = "#d4bfff",
  dark_purple ="3B4252",
  cyan = "#88C0D0",
  dark_cyan = "#88C0D0"
}

local themes = {
  embark = embark
}

local get_theme = function()
  theme = themes[os.getenv("THEME")] or embark
  return theme
end

return {
  get_theme = get_theme
}

