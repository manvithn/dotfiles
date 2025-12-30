local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.disable_default_key_bindings = true
local act = wezterm.action
config.keys = {
  { key = 'LeftArrow', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },

  { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
  { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  { key = '[', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = '{', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = '{', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },

  { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
  { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  { key = ']', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },
  { key = '}', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = '}', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },

  { key = ',', mods = 'SHIFT|SUPER', action = act.MoveTabRelative(-1) },
  { key = '<', mods = 'SUPER', action = act.MoveTabRelative(-1) },
  { key = '<', mods = 'SHIFT|SUPER', action = act.MoveTabRelative(-1) },
  { key = ',', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
  { key = '<', mods = 'CTRL', action = act.MoveTabRelative(-1) },
  { key = '<', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },

  { key = '.', mods = 'SHIFT|SUPER', action = act.MoveTabRelative(1) },
  { key = '>', mods = 'SUPER', action = act.MoveTabRelative(1) },
  { key = '>', mods = 'SHIFT|SUPER', action = act.MoveTabRelative(1) },
  { key = '.', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
  { key = '>', mods = 'CTRL', action = act.MoveTabRelative(1) },
  { key = '>', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },

  { key = 'LeftArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Down' },

  { key = 'LeftArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Left', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Right', 1 } },
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Up', 1 } },
  { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize{ 'Down', 1 } },

  { key = ';', mods = 'SHIFT|SUPER', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = ':', mods = 'SUPER', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = ':', mods = 'SHIFT|SUPER', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = ';', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = ':', mods = 'CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = ':', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },

  { key = '\'', mods = 'SHIFT|SUPER', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'SUPER', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'SHIFT|SUPER', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\'', mods = 'SHIFT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'SHIFT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

  { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
  { key = 'n', mods = 'CTRL', action = act.SpawnWindow },
  { key = 'q', mods = 'SUPER', action = act.QuitApplication },
  { key = 'q', mods = 'CTRL', action = act.QuitApplication },
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
  { key = 'c', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
  { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'u', mods = 'SUPER', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'u', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },

  { key = 't', mods = 'SHIFT|CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'T', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'T', mods = 'SHIFT|CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'w', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'w', mods = 'CTRL' } },
  { key = 'W', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'W', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'w', mods = 'CTRL' } },
  { key = 'n', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'n', mods = 'CTRL' } },
  { key = 'N', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'n', mods = 'CTRL' } },
  { key = 'q', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'q', mods = 'CTRL' } },
  { key = 'Q', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'Q', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'q', mods = 'CTRL' } },
  { key = 'c', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'c', mods = 'CTRL' } },
  { key = 'C', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'C', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'c', mods = 'CTRL' } },
  { key = 'v', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'v', mods = 'CTRL' } },
  { key = 'V', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'V', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'v', mods = 'CTRL' } },
  { key = 'f', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'f', mods = 'CTRL' } },
  { key = 'F', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'F', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'f', mods = 'CTRL' } },
  { key = 'u', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'u', mods = 'CTRL' } },
  { key = 'U', mods = 'CTRL', action = act.SendKey { key = 't', mods = 'CTRL' } },
  { key = 'U', mods = 'SHIFT|CTRL', action = act.SendKey { key = 'u', mods = 'CTRL' } },

  { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
  { key = '=', mods = 'SHIFT|SUPER', action = act.IncreaseFontSize },
  { key = '+', mods = 'SUPER', action = act.IncreaseFontSize },
  { key = '+', mods = 'SHIFT|SUPER', action = act.IncreaseFontSize },
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '+', mods = 'SUPER|CTRL', action = act.IncreaseFontSize },

  { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
  { key = '-', mods = 'SHIFT|SUPER', action = act.DecreaseFontSize },
  { key = '_', mods = 'SUPER', action = act.DecreaseFontSize },
  { key = '_', mods = 'SHIFT|SUPER', action = act.DecreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
  { key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },

  { key = '0', mods = 'SUPER', action = act.ResetFontSize },
  { key = '0', mods = 'SHIFT|SUPER', action = act.ResetFontSize },
  { key = ')', mods = 'SUPER', action = act.ResetFontSize },
  { key = ')', mods = 'SHIFT|SUPER', action = act.ResetFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  { key = ')', mods = 'CTRL', action = act.ResetFontSize },
  { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },

  { key = 'r', mods = 'SHIFT|SUPER', action = act.ReloadConfiguration },
  { key = 'R', mods = 'SUPER', action = act.ReloadConfiguration },
  { key = 'R', mods = 'SHIFT|SUPER', action = act.ReloadConfiguration },
  { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
  { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },

  { key = 'k', mods = 'SHIFT|SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'SHIFT|SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },

  { key = 'l', mods = 'SHIFT|SUPER', action = act.ShowDebugOverlay },
  { key = 'L', mods = 'SUPER', action = act.ShowDebugOverlay },
  { key = 'L', mods = 'SHIFT|SUPER', action = act.ShowDebugOverlay },
  { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
  { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
  { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },

  { key = 'p', mods = 'SHIFT|SUPER', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'SUPER', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'SHIFT|SUPER', action = act.ActivateCommandPalette },
  { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },

--  { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
--  { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
--  { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },

--  { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
--  { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
--  { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

--  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
}

config.scrollback_lines = 10000
config.audible_bell = 'Disabled'
config.prefer_to_spawn_tabs = true

config.default_cursor_style = 'SteadyBar'
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
local adjusted_mocha = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
adjusted_mocha.tab_bar.active_tab.italic = true
adjusted_mocha.tab_bar.active_tab.intensity = 'Bold'
config.colors = adjusted_mocha

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)
    return {
      { Text = '  ' .. title .. '  ' },
    }
  end
)

config.font = wezterm.font 'MesloLGS NF'
-- config.front_end = 'WebGpu'
-- config.freetype_load_flags = 'NO_HINTING'
-- config.freetype_load_target = 'HorizontalLcd'
-- config.freetype_render_target = 'HorizontalLcd'
config.cell_width = 1.05

config.hyperlink_rules = {
  {
    -- Linkify things that look like URLs
    -- This is actually the default if you don't specify any hyperlink_rules
    regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
    format = "$0",
  },
  {
    -- Make task, diff and paste numbers clickable
    regex = "\\b([tTdDpP]\\d+)\\b",
    format = "https://fburl.com/b/$1",
  },
}

-- See: https://wezfurlong.org/wezterm/quickselect.html
config.quick_select_patterns = {
  -- Make task, diff and paste numbers quick-selectable
  "\\b([tTdDpP]\\d+)\\b",
}

local sb_remote = "devvm13400.rva0.facebook.com"
config.tls_clients = {
  {
    name = "sb",
    remote_address = sb_remote .. ":8098",
    bootstrap_via_ssh = sb_remote,
  },
}

return config

