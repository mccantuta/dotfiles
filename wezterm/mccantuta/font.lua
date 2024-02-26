local module = {}

function module.apply_font(config, wezterm)
  config.font = wezterm.font({family = 'MonaspiceNe Nerd Font Mono', weight = 'Regular', style='Normal'})
  --config.font = wezterm.font({family = 'Inconsolata Nerd Font Mono', weight = 'Regular', style='Normal'})
  --config.font = wezterm.font({family = 'JetBrainsMono Nerd Font Mono', weight = 'DemiBold', style='Normal'})
  --config.font = wezterm.font({family = 'Hack Nerd Font Mono', weight = 'Regular', style='Normal'})
  --config.font = wezterm.font({family = 'Maple Mono', weight = 'Regular', style='Normal'})
  --config.font = wezterm.font({family = 'JuliaMono', weight = 'Regular', style='Normal'})
  --config.font = wezterm.font({family = 'FiraMono Nerd Font Mono', weight = 'Regular', style='Normal'})
  config.font_size = 20.0
end

return module

