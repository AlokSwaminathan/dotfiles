if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ccat="/usr/bin/cat"
    alias cat="bat"

    alias ls="exa"

    alias lg="lazygit"

    alias lazyvim="NVIM_APPNAME=lazyvim nvim"
    alias nvchad="NVIM_APPNAME=nvchad nvim"
    
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    alias lgd="lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

set -x XDG_CONFIG_HOME "/home/aswaminathan/.config/"
fish_vi_key_bindings


if status is-login
    # Start sway
    if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" -eq 1 -a (tty) = /dev/tty1
        export SDL_VIDEODRIVER=wayland
        export _JAVA_AWT_WM_NONREPARENTING=1
        export QT_QPA_PLATFORM=wayland
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_DESKTOP=sway
	export TERMINAL=/usr/bin/foot
        exec sway -d 2>sway.log
    end
end
