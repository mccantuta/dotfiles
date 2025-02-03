# README
# Copy configurarion file to ~/.config/fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias l 'ls -lia'

# Set environment variables
# set -x VARIABLE_NAME variable_value
set -x GOBIN /Users/mccantuta/go/bin
set -x TERM screen-256color

# Add Golang packages to Path
fish_add_path /Users/mccantuta/go/bin
fish_add_path /usr/local/bin
fish_add_path /Users/mccantuta/.local/bin

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

starship init fish | source

# Set up fzf key bindings
# fzf --fish | source
