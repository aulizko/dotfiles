local wezterm = require "wezterm"

local function get_color_scheme_by_sunset(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

local tab_colors = {
  ["Dark"] = {
    edge_background = "#313244",
    background = "#181825",
    foreground = "#cdd6f4",

    active_background = "#cba6f7",
    active_foreground = "#11111b",

    hover_background = "#1e1e2e",
    hover_foreground = "#cdd6f4",
  },
  ["Light"] = {
    edge_background = "#ccd0da",
    background = "#e6e9ef",
    foreground = "#4c4f69",

    active_background = "#8839ef",
    active_foreground = "#dce0e8",

    hover_background = "#eff1f5",
    hover_foreground = "#4c4f69",
  },
}

-- Tab formatting taken from:
-- Source: https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614
-- Author: UnderCooled https://github.com/UnderCooled


-- TODO: move to the separate module
-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

local ADMIN_ICON = utf8.char(0xf49c)

local ELV_ICON = utf8.char(0xfc6f)
local FISH_ICON = utf8.char(0xf023a)

local VIM_ICON = utf8.char(0xe62b)
local EMACS_ICON = utf8.char(0xeb99)
local PAGER_ICON = utf8.char(0xf718)
local FUZZY_ICON = utf8.char(0xf0b0)
local HOURGLASS_ICON = utf8.char(0xf252)
local SUNGLASS_ICON = utf8.char(0xf9df)
local DOCKER_ICON = utf8.char(0xf0868)
local GIT_ICON = utf8.char(0xf1d3)

local PYTHON_ICON = utf8.char(0xf820)
local NODE_ICON = utf8.char(0xe74e)
local LAMBDA_ICON = utf8.char(0xfb26)
local RUST_ICON = utf8.char(0xe7a8)
local GO_ICON = utf8.char(0xe627)

local SUP_IDX = {"¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹","¹⁰",
                 "¹¹","¹²","¹³","¹⁴","¹⁵","¹⁶","¹⁷","¹⁸","¹⁹","²⁰"}
local SUB_IDX = {"₁","₂","₃","₄","₅","₆","₇","₈","₉","₁₀",
                 "₁₁","₁₂","₁₃","₁₄","₁₅","₁₆","₁₇","₁₈","₁₉","₂₀"}


wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local appearance_string = wezterm.gui.get_appearance()
  local current_tab_bar_colors = tab_colors[appearance_string]
  local edge_background = current_tab_bar_colors.edge_background

  local background = current_tab_bar_colors.background
  local foreground = current_tab_bar_colors.foreground

  if tab.is_active then
    background = current_tab_bar_colors.active_background
    foreground = current_tab_bar_colors.active_foreground
  elseif hover then
    background = current_tab_bar_colors.hover_background
    foreground = current_tab_bar_colors.hover_foreground
  end

  local edge_foreground = background

  local process_name = tab.active_pane.foreground_process_name
  local pane_title = tab.active_pane.title
  local exec_name = basename(process_name)
  local title_with_icon

  if exec_name == "elvish" then
    title_with_icon = ELV_ICON .. " Elvish"
  elseif exec_name == "fish" then
    title_with_icon = FISH_ICON .. " " .. pane_title
  elseif exec_name == "nvim" then
    title_with_icon = VIM_ICON .. pane_title:gsub("^(%S+)%s+(%d+/%d+) %- nvim", " %2 %1")
  elseif exec_name == "emacs" then
    title_with_icon = EMACS_ICON .. pane_title:gsub("^(%S+)%s+(%d+/%d+) %- emacs", " %2 %1")
  elseif exec_name == "bat" or exec_name == "less" or exec_name == "moar" then
    title_with_icon = PAGER_ICON .. " " .. exec_name:upper()
  elseif exec_name == "fzf" or exec_name == "hs" or exec_name == "peco" then
    title_with_icon = FUZZY_ICON .. " " .. exec_name:upper()
  elseif exec_name == "btm" or exec_name == "ntop" then
    title_with_icon = SUNGLASS_ICON .. " " .. exec_name:upper()
  elseif exec_name == "python" or exec_name == "hiss" then
    title_with_icon = PYTHON_ICON .. " " .. exec_name
  elseif exec_name == "node" then
    title_with_icon = NODE_ICON .. " " .. exec_name:upper()
  elseif exec_name == "bb" or exec_name == "cmd-clj" then
    title_with_icon = LAMBDA_ICON .. " " .. exec_name:gsub("bb", "Babashka"):gsub("cmd%-clj", "Clojure")
  elseif exec_name == "janet" or exec_name == "hy" or exec_name == "sbcl" then
    title_with_icon = LAMBDA_ICON .. " " .. exec_name
  elseif exec_name == "docker" or exec_name == "lima" or exec_name == "qemu" or exec_name == "colima" then
    title_with_icon = DOCKER_ICON .. " " .. exec_name
  elseif exec_name == "rustc" or exec_name == "rustup" or exec_name == "cargo" then
    title_with_icon = RUST_ICON .. " " .. exec_name
  elseif exec_name == "go" then
    title_with_icon = GO_ICON .. " " .. exec_name
  elseif exec_name == "git" then
    title_with_icon = GIT_ICON .. " " .. pane_title
  else
    title_with_icon = HOURGLASS_ICON .. " " .. exec_name
  end
  if pane_title:match("^sudo") then
    title_with_icon = title_with_icon .. " " .. ADMIN_ICON
  end

  local left_arrow = SOLID_LEFT_ARROW
  if tab.tab_index == 0 then
    left_arrow = SOLID_LEFT_MOST
  end


  local id = SUB_IDX[tab.tab_index+1]
  local pid = SUP_IDX[tab.active_pane.pane_index+1]
  local title = " " .. wezterm.truncate_right(title_with_icon, max_width - 6) .. " "

  return {
    {Attribute={Intensity="Bold"}},
    {Background={Color=edge_background}},
    {Foreground={Color=edge_foreground}},
    {Text=left_arrow},
    {Background={Color=background}},
    {Foreground={Color=foreground}},
    {Text=id},
    {Text=title},
    {Foreground={Color=foreground}},
    {Text=pid},
    {Background={Color=edge_background}},
    {Foreground={Color=edge_foreground}},
    {Text=SOLID_RIGHT_ARROW},
    {Attribute={Intensity="Normal"}},
  }
end)

return {
  -- Main config
  automatically_reload_config = true,
  -- Tab bar [distraction-free mode]
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  show_tab_index_in_tab_bar = true,
  tab_max_width = 60,
  -- Window size
  initial_cols = 130,
  initial_rows = 40,
  -- Font configuration
  -- https://wezfurlong.org/wezterm/config/fonts.html
  font = wezterm.font('JetBrainsMono Nerd Font Mono'),
  font_size = 20.0,
  -- Bells
  audible_bell = 'Disabled',
  colors = {
    visual_bell = '#602020'
  },
  visual_bell = {
    fade_in_duration_ms = 75,
    fade_out_duration_ms = 75,
    target = "CursorColor",
  },
  -- Color scheme (adjasted by sunset)
  color_scheme = get_color_scheme_by_sunset(wezterm.gui.get_appearance()),
}
