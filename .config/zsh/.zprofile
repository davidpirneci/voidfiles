# Default programs
export EDITOR="nvim"
export TERMINAL="foot"
export BROWSER="firefox"

# Keep the home folder clean
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export LESSHISTFILE="-"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"

# Your own scripts go on the PATH
export PATH="$HOME/.local/bin:$PATH"

# Wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export _JAVA_AWT_WM_NONREPARENTING=1

eval "$(ssh-agent -s)" >/dev/null

# Start sway on tty1
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = /dev/tty1 ]; then
  dbus-run-session sway
fi
