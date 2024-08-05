# README
# Copy configurarion file to ~/.config/fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias l 'ls -la'

# Set environment variables
# set -x VARIABLE_NAME variable_value

# Add Golang packages to Path
#fish_add_path /Users/mccantuta/go/bin

starship init fish | source

# Set up fzf key bindings
# fzf --fish | source
