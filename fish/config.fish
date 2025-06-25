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

        if ! set -q GLOBAL_VAR_INIT
            set homebrew_prefix $(brew --prefix)

            set -Ux LIBRARY_PATH $LIBRARY_PATH "$homebrew_prefix/lib"
            set -Ux GLOBAL_VAR_INIT
        end
end

# Go executables
if command -q go
    fish_add_path $HOME/go/bin
end

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Docker
if ! command -q docker && test -d $HOME/Applications/Docker.app
    fish_add_path $HOME/Applications/Docker.app/Contents/Resources/bin
end

# Eyecandy 🍬
if string match -q "alacritty" $TERM
    fastfetch
end
