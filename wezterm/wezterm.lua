local wezterm = require "wezterm"

local function get_color_scheme_by_sunset(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

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

local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
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
    title_with_icon = LAMBDA_ICON .. exec_name
  elseif exec_name == "docker" or exec_name == "lima" or exec_name == "qemu" or exec_name == "colima" then
    title_with_icon = DOCKER_ICON .. exec_name
  elseif exec_name == "rustc" or exec_name == "rustup" or exec_name == "rustc" or exec_name == "cargo" then
    title_with_icon = RUST_ICON .. exec_name
  elseif exec_name == "go" then
    title_with_icon = GO_ICON .. exec_name
  elseif exec_name == "git" then
    title_with_icon = GIT_ICON .. " " .. pane_title
  else
    title_with_icon = HOURGLASS_ICON .. " " .. exec_name
  end

  local title = " " .. wezterm.truncate_right(title_with_icon, max_width - 6) .. " "

  return "   " .. title .. "   "
end)

return {
  -- Main config
  automatically_reload_config = true,
  -- Tab bar [distraction-free mode]
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  show_tab_index_in_tab_bar = true,
  tab_max_width = 25,
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
