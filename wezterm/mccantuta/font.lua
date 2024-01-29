local module = {}

function module.apply_font(config, wezterm)
  --config.font = wezterm.font 'MonaspiceNe Nerd Font Mono'
  --config.font = wezterm.font 'Inconsolata Nerd Font Mono'
  config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
  config.font_size = 18.0
end

return module

