# Default config
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable greeting
set fish_greeting

# OS-specifi
switch (uname)
    case Darwin
        # Homebrew
        ## User installation
        if test -d $HOME/homebrew
            fish_add_path $HOME/homebrew/bin
        end
end

# Eyecandy 🍬
if string match -q "alacritty" $TERM
    neofetch
end
