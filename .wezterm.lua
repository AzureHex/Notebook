-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.check_for_updates = false
bold_brightens_ansi_colors = true
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.color_scheme = 'Catppuccin Frappe' -- Catppuccin Frappe | Mocha | Macchiato, duskfox, Dracula (Official)
config.enable_tab_bar = false
config.allow_win32_input_mode = true
config.default_prog = { 'pwsh.exe' }
config.initial_cols = 132
config.initial_rows = 32
config.default_cursor_style = 'BlinkingBar'
config.audible_bell = "SystemBeep"
config.adjust_window_size_when_changing_font_size = true
config.hide_tab_bar_if_only_one_tab = true
config.notification_handling = "AlwaysShow"
config.show_update_window = false
config.term = "xterm-256color"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- RESIZE, TITLE, NONE

-- Customize the command palette font size and appearance
config.command_palette_font_size = 12
config.command_palette_fg_color = "#ffffff"  -- Customize foreground color
config.command_palette_bg_color = "#44475a"  -- Customize background color
--config.font_shaper = "Harfbuzz"
--config.harfbuzz_features = { 'zero', 'liga=0', 'clig=0', 'calt=0' } 

--config.window_background_opacity = 0.97
--config.win32_system_backdrop = 'Acrylic' -- Acrylic, Mica, Tabbed
--config.macos_window_background_blur = 20

config.window_padding = {
    left = '0cell',
    right = '0cell',
    top = '0cell',
    bottom = '0cell',
}

-- Define the colors based on your preference
config.colors = {
  foreground = "#c6d0f5",
--  background = "#2e2e2e",
  cursor_bg = "#ffe4b5",  -- Set cursor background color
  cursor_fg = "#3a3a3a",  -- Set cursor foreground color (text)
  cursor_border = "#ffe4b5",  -- Set cursor border color
  selection_bg = "#414868",
  selection_fg = "#c6d0f5",
  scrollbar_thumb = "#414868",
  split = "#414868",
  }

return config
