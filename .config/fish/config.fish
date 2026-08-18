if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cd="z"

    alias ccat="/bin/cat"
    alias cat="bat"

    alias ls="eza"

    alias lg="lazygit"

    alias lazyvim="NVIM_APPNAME=lazyvim nvim"
    alias nvchad="NVIM_APPNAME=nvchad nvim"

    alias ssh="TERM=xterm-256color /usr/bin/ssh"

    alias lc="leetcode"

    abbr -a gpp 'g++ -std=c++20 -I/opt/homebrew/Cellar/gcc/15.2.0_1/include/c++/15/aarch64-apple-darwin25 -D_GLIBCXX_HOSTED=1 -O1 -g -fsanitize=address -fno-omit-frame-pointer -Wl,-stack_size,0x10000000'

    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    alias lgd="lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    zoxide init fish | source
end

set -x XDG_CONFIG_HOME "/Users/aswamina/.config/"
set -x VISUAL /usr/bin/nvim

# 1. Force fish to send cursor shape sequences (the -g global flag is critical)
set -g fish_vi_force_cursor 1

# 2. Define the cursor shapes globally
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_visual block
set -g fish_cursor_replace_one underscore
set -g fish_cursor_replace underscore

# 3. Initialize vi keybindings AFTER the above variables are set
fish_vi_key_bindings


# pnpm
set -gx PNPM_HOME "/Users/aswamina/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

starship init fish | source
fish_add_path /Users/aswamina/.pixi/bin

# Added by Antigravity
fish_add_path /Users/aswamina/.antigravity/antigravity/bin
