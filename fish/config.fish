if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "fish default"

# https://starship.rs/
starship init fish | source

# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source
