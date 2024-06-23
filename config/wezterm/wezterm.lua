local wezterm = require("wezterm")
local p = require("palette")
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "catppuccin-macchiato"
config.font_size = 16
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 512
config.initial_rows = 128
config.scrollback_lines = 65536
config.tab_max_width = 32
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

config.colors = {
  tab_bar = {
    background = p.base,
    active_tab = {
      fg_color = p.text,
      bg_color = p.surface2,
    },
    inactive_tab = {
      fg_color = p.subtext0,
      bg_color = p.base,
    },
    inactive_tab_hover = {
      fg_color = p.text,
      bg_color = p.surface0,
    },
    new_tab = {
      fg_color = p.subtext0,
      bg_color = p.base,
    },
    new_tab_hover = {
      fg_color = p.text,
      bg_color = p.surface0,
    },
  },
}

config.keys = {
  { mods = "CMD", key = "Enter", action = act.ActivateCopyMode },
  { mods = "CMD", key = "t", action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
  { mods = "CMD|SHIFT", key = "[", action = act.MoveTabRelative(-1) },
  { mods = "CMD|SHIFT", key = "]", action = act.MoveTabRelative(1) },
  { mods = "CMD|SHIFT", key = "h", action = act.ActivateTabRelative(-1) },
  { mods = "CMD|SHIFT", key = "l", action = act.ActivateTabRelative(1) },
  { mods = "CMD|SHIFT", key = "r", action = act.ReloadConfiguration },
  { mods = "CMD|SHIFT", key = "t", action = act.SpawnTab("DefaultDomain") },
  { mods = "CTRL|SHIFT", key = "t", action = act.DisableDefaultAssignment },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Middle" } },
    mods = "NONE",
    action = act.DisableDefaultAssignment,
  },
}

config.skip_close_confirmation_for_processes_named = {
  "sh",
  "bash",
  "fish",
  "nvim",
}

return config
