local wezterm = require "wezterm"

-- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)
--

local raw_os_name = io.popen('uname -s','r'):read('*l')

local act = wezterm.action

local mykeys = {
  {
    key    = '-',
    mods   = 'CTRL|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key    = '\\',
    mods   = 'CTRL|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key    = 'h',
    mods   = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key    = 'l',
    mods   = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key    = 'k',
    mods   = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key    = 'j',
    mods   = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key    = 'h',
    mods   = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Left', 5}
  },
  {
    key    = 'l',
    mods   = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Right', 5}
  },
  {
    key    = 'j',
    mods   = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Down', 5}
  },
  {
    key    = 'k',
    mods   = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Up', 5}
  },
}

for i = 1, 8 do
  -- ALT + number to activate that tab
  table.insert(mykeys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  -- table.insert(mykeys, {
  --   key = 'F' .. tostring(i),
  --   action = act.ActivateTab(i - 1),
  -- })
end

-- print(mykeys)

local window_decoration_type = ''
if raw_os_name == "Linux" then
  window_decoration_type = "NONE"
else
  window_decoration_type = "RESIZE"
end

return {
  font = wezterm.font_with_fallback {
    "Comic Code",
    "FiraCode Nerd Font",
  },

  font_size = 14.5,

  -- color_scheme = "Dracula+",
  -- color_scheme = "DoomOne",
  color_scheme = "Catppuccin Frappe",
  -- color_scheme = "Catppuccin Latte",
  -- color_scheme = "Catppuccin Mocha",
  -- color_scheme = "Catppuccin Mocha",
  -- color_scheme = "aikofog (terminal.sexy)",

  window_decorations = window_decoration_type,

  window_background_opacity = 1,
  -- window_background_opacity = 1.00,
  -- window_background_opacity = 0.3
  macos_window_background_blur = 20,

  adjust_window_size_when_changing_font_size = false,

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,

  keys = mykeys,

  -- unix_domains = {
  --   {
  --     name = 'default',
  --   },
  -- },

  -- This causes `wezterm` to act as though it was started as
  -- `wezterm connect unix` by default, connecting to the unix
  -- domain on startup.
  -- If you prefer to connect manually, leave out this line.
  -- default_gui_startup_args = { 'connect', 'default' },
}

