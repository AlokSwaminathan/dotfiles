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

    alias cp-kernel="sudo cp arch/x86/boot/bzImage /boot/compiled_linux/; sudo mkinitcpio -k /boot/compiled_linux/bzImage -c /etc/mkinitcpio.conf -g /boot/compiled_linux/initramfs.img -p /etc/mkinitcpio.compiled_kernel.d/compiled_kernel.preset"

    alias ssh="TERM=xterm-256color /usr/bin/ssh"

    zoxide init fish | source
end

set -x XDG_CONFIG_HOME "/home/aswaminathan/.config/"
set -x VISUAL "/usr/bin/nvim"
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

# pnpm
set -gx PNPM_HOME "/home/aswaminathan/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

starship init fish | source
