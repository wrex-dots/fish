# Set this BEFORE `fishenv`, for obvious reasons
set -gx EDITOR nvim

# Quick way to get here
abbr -a fishenv $EDITOR (status -f)

########################################
##          ENV SETTINGS              ##
########################################
# Things set here are the things that can't be set through Hyprland's configs.
# This is mostly the case when they use command substitution and cannot be
# written in a fixed string.

# If you use (Neo)Vim, well first of all you're a good person,
# but also use it as a diff program.
if string match -q -- nvim $EDITOR
  set -gx DIFFPROG $EDITOR
end

# GPG required setup
# Can't be set with Hyprland because it requires running a thing
set -gx GPG_TTY (tty)

# Local PNPM installation dir
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
