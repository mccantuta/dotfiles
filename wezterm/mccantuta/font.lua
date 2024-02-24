local module = {}

function module.apply_font(config, wezterm)
  --config.font = wezterm.font 'MonaspiceNe Nerd Font Mono'
  --config.font = wezterm.font 'Inconsolata Nerd Font Mono'
  config.font = wezterm.font({family = 'JetBrainsMono Nerd Font Mono', weight = 'Bold', style='Normal'})
  --config.font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular', style="Normal"})
  config.font_size = 20.0
end

return module

