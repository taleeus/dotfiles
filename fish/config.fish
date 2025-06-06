# Default config
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable greeting
set fish_greeting

# OS-specific
switch (uname)
    case Darwin
        # Homebrew
        ## User installation
        if test -d $HOME/homebrew
            fish_add_path $HOME/homebrew/bin
        end
end

# Go executables
if command -q go
    fish_add_path $HOME/go/bin
end

# Eyecandy 🍬
if string match -q "alacritty" $TERM
    neofetch
end
