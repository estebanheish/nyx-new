local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.font =  wezterm.font 'Martian Mono Std Md'
config.color_scheme = 'Ayu Mirage (Gogh)'
config.front_end = "WebGpu"

config.keys = {
  { key = 'Enter', mods = 'ALT', action = act.DisableDefaultAssignment },
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'E', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'N', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'H', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'I', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'f', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
}

local search_mode = nil
if wezterm.gui then
  search_mode = wezterm.gui.default_key_tables().search_mode
  table.insert(
    search_mode,
    { key = 'N', mods = 'CTRL', action = act.CopyMode 'PriorMatch' }
  )
end

config.key_tables = { search_mode = search_mode }

return config
