local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

config.default_cwd = "/home/ashlen152"
config.set_environment_variables = {
  PATH = os.getenv("PATH"),
}
-- config.default_prog = { "/opt/homebrew/bin/tmux", "-l" }
config.color_scheme = "Tokyo Night"

config.font = wezterm.font("Hack", { stretch = "Expanded", weight = "Regular" })
config.font_size = 13

config.window_background_opacity = 0.82
config.macos_window_background_blur = 35
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_background_image_hsb = {
  brightness = 0.88,
  hue = 1.0,
  saturation = 0.7,
}
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

return config
