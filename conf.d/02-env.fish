# Quick way to get here
abbr -a fishenv $EDITOR (status -f)

function addenv --description "Add/Edit an environment variable"
    set -l key $argv[1]
    set -l val $argv[2]

    if ! set -q $key
        set -Ux $key $val
    else if [ "$$key" != "$val" ]
        set -e $key
        and addenv $key $val
    end
end

function setconf --description "Set a config file for NAME shortcut as \$conf_NAME"
    set -l key "conf_$argv[1]"
    set -l val $argv[2]

    if [ -f "$val" -o -L "$val" ]
        addenv $key $argv[2]
    else
        echo "[setconf]: Invalid file for $argv[1]" >&2 && return 1
    end
end

function setcdir --description "Set a config directory for NAME as \$cdir_NAME"
    set -l key "cdir_$argv[1]"
    set -l val $argv[2]

    if [ -d "$val" -o -L "$val" ]
        addenv $key $argv[2]
    else
        echo "[setcdir]: Invalid directory for $argv[1]" >&2 && return 1
    end
end

set -l CFGDIR $XDG_CONFIG_HOME

########################################
##          ENV SETTINGS              ##
########################################
# Things set here are the things that can't be set through Hyprland's configs.
# This is mostly the case when they use command substitution and cannot be
# written in a fixed string.

# If it is installed, prefer NeoVim over Vim for pacdiff,
addenv DIFFPROG (printf '%s -d' (command -s nvim || command -s vim))

# GPG stuff, can't be set with Hyprland because it requires running a thing
addenv GPG_TTY (tty)

# Local PNPM installation dir
set -gx PNPM_HOME "/home/wrexes/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

########################################
##         CONFIG LOCATIONS           ##
########################################
# Fish shell
setcdir fish $CFGDIR/fish
setconf fish $cdir_fish/config.fish

# Starship prompt
setconf starship $CFGDIR/starship.toml

# Rofi (app launcher)
setcdir rofi $CFGDIR/rofi
setconf rofi $cdir_rofi/config.rasi

# N/Vim
setcdir nvim $CFGDIR/nvim

# Yet Another Yogurt
setcdir yay $CFGDIR/yay
setconf yay $cdir_yay/config.json
