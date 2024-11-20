local wezterm = require("wezterm")

-- Configuration setup
local config = wezterm.config_builder()

config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 2000 }
config.automatically_reload_config = true
config.check_for_updates = false
config.bold_brightens_ansi_colors = true
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.color_scheme = "Catppuccin Macchiato" -- Catppuccin Frappe | Mocha | Macchiato, duskfox, Dracula (Official)
config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_and_split_indices_are_zero_based = false
config.allow_win32_input_mode = true
config.default_prog = { "pwsh.exe" }
config.initial_cols = 135
config.initial_rows = 33
config.default_cursor_style = "BlinkingBar"
config.audible_bell = "SystemBeep"
config.adjust_window_size_when_changing_font_size = true
config.notification_handling = "AlwaysShow"
config.show_update_window = true
config.term = "xterm-256color"
config.window_decorations = "RESIZE" -- RESIZE, INTEGRATED_BUTTONS|RESIZE, TITLE, NONE
--config.window_background_opacity = 0.99
--config.win32_system_backdrop = "Acrylic" -- "Acrylic" or "Mica"

-- Customize the command palette font size and appearance
config.command_palette_font_size = 12
config.command_palette_fg_color = "#ffffff" -- Customize foreground color
config.command_palette_bg_color = "#44475a" -- Customize background color

-- Disable Ctrl+Shift+T (default behavior for opening a new tab)
config.keys = {
	{ key = "T", mods = "CTRL|SHIFT", action = wezterm.action({ SendString = "" }) },
	{ mods = "LEADER", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "x", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ mods = "LEADER", key = "b", action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(2) },
	{ mods = "LEADER", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER|SHIFT", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ mods = "LEADER", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ mods = "LEADER", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ mods = "LEADER", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	{ mods = "LEADER", key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ mods = "LEADER", key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ mods = "LEADER", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ mods = "LEADER", key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ mods = "LEADER", key = "z", action = wezterm.action.TogglePaneZoomState },
}

-- Map leader + number to activate tabs
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Status line update
wezterm.on("update-right-status", function(window, _)
	local prefix = window:leader_is_active() and " " .. utf8.char(0x1F34E) or ""
	local arrow_fg = window:active_tab():tab_id() ~= 0 and { Foreground = { Color = "#1e2030" } }
		or { Foreground = { Color = "#c6a0f6" } }

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		arrow_fg,
		{ Text = utf8.char(0xe0b2) }, -- Solid Left Arrow
	}))
end)

-- Window padding configuration
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Custom colors
config.colors = {
	cursor_bg = "#ffe4b5", -- Set cursor background color
	cursor_fg = "#3a3a3a", -- Set cursor foreground color (text)
	cursor_border = "#ffe4b5", -- Set cursor border color
	selection_bg = "#414868",
	selection_fg = "#c6d0f5",
	scrollbar_thumb = "#414868",
	split = "#414868",
}

return config

