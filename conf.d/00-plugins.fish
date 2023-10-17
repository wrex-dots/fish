# Automatically install fundle
if not functions -q fundle;
    eval (curl -sfL https://git.io/fundle-install);
end

# Easily access your plugin folder
set -Ux fish_plugin_dir (realpath $__fish_config_dir/fundle)
# And plugin list
set -Ux fish_plugins (realpath $__fish_config_dir/fish_plugins)

# Create the directory if necessary
if ! test -d $fish_plugin_dir
  mkdir -p $fish_plugin_dir
end

# Read the plugin list and store it
set -l __plugins (
  string split0 -- (
    # Filter out commented lines
    string match -r '^\s*[^#-]\w(?:-|\w)+[^-]\/.+$' -- (cat $fish_plugins)
  )
)

# Enable all plugins in the list
for p in $__plugins
  fundle plugin (string trim -- $p)
end

# Try initialising plugins.
# If any are missing, install them and reload the shell.
if not fundle init >/dev/null
    set_color brgreen
      echo "Populating your plugin directory ($fish_plugin_dir)..."
    set_color normal
    fundle install --no-quiet
    set_color brgreen
      echo "Done !"
    set_color normal
    exec fish
end
