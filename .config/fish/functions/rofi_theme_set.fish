function rofi_theme_set
    if not test (count $argv) -eq 1
        echo "Need to pass one argument which should be a theme name"
        return 1
    end
    set theme_file (string join '' "$XDG_CONFIG_HOME/rofi/themes/" $argv[1] ".rasi")
    if not test -f $theme_file
        echo "No file at $theme_file"
        return 1
    end
    sed -i "s|@theme.*|@theme \"themes/$argv[1]\"|" ~/.config/rofi/config.rasi
end
