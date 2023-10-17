## For setting $PATH, check $__fish_config_dir/conf.d/01-path.fish
## For other environment variables, see $__fish_config_dir/conf.d/02-env.fish

# Autostart
    # Terminal themeing based on current wallpaper
    command -q wal && command -q wallpaper
        and wal -qnei (wallpaper 2>/dev/null) 2>/dev/null &
    # Starship prompt
    command -q starship
        and starship init fish | source
    # The Fuck
    command -q thefuck
        and thefuck --alias | source
    # Fast Node Manager (A pretty fast alternative to Node Version Mwitcher)
    command -q fnm
        and fnm env --use-on-cd --version-file-strategy=recursive | source
    # Direnv
    command -q direnv
        and direnv hook fish | source

# Silly greeting
    set -U fish_greeting "Today is a good day to code avec le cul !"

# Key bindings
    fish_default_key_bindings
    #fish_vi_key_bindings

# Shortcuts
# -- Git / Gitnow
    if functions -q gitnow
      function __multiline_gitnow --description 'Properly display Gitnow output on 2-line prompts'
        echo
        $argv
        echo
        echo
        commandline -f repaint
      end

      # Alt+l : Print a git pretty-log
      set -l __log_cmd 'log';
      if grep --quiet --fixed-strings 'splog' ~/.gitconfig 2>/dev/null
          set __log_cmd 'splog'
      end
      bind \el "__multiline_gitnow git $__log_cmd"

      # Alt+g : Show a git diff
      bind \eg '__multiline_gitnow git diff'

      # Alt+s : Print a compact git status status
      bind \es '__multiline_gitnow state'

      # Alt+m : Show last commit
      bind \em '__multiline_gitnow show'
    end


# Perl Local::Lib
# I don't remember why this is in my config, but I don't see a reason to remove it. 🤷
if command -v perl > /dev/null 2>&1 && command -v cpanm > /dev/null 2>&1
  test -d "$HOME/perl5/lib/perl5" && eval (perl -I "$HOME/perl5/lib/perl5" -Mlocal::lib)
end
