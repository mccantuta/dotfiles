local module = {}

function module.apply_window_format(config)
    config.initial_cols = 120
    config.initial_rows = 24

    config.window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0,
    }

    config.window_frame = {
      border_left_width = 0,
      border_right_width = 0,
      border_bottom_height = 0,
      border_top_height = 0,
      border_left_color = 'purple',
      border_right_color = 'purple',
      border_bottom_color = 'purple',
      border_top_color = 'purple',
    }
end

return module
