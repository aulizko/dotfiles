local wezterm = require "wezterm"

local function get_color_scheme_by_sunset(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

return {
  -- Main config
  automatically_reload_config = true,
  -- Tab bar [distraction-free mode]
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  -- Window size
  initial_cols = 130,
  initial_rows = 40,
  -- Font configuration
  -- https://wezfurlong.org/wezterm/config/fonts.html
  font = wezterm.font('FiraCode Nerd Font Mono'),
  font_size = 20.0,
  -- Color scheme (adjasted by sunset)
  color_scheme = get_color_scheme_by_sunset(wezterm.gui.get_appearance()),
}
