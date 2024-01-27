# Quick way to get here
abbr -a fishenv $EDITOR (status -f)

function addpath --description 'Extend PATH with new values'
  for i in (seq (count $argv))
    if not string match -q -- $argv[$i] $PATH && test -d $argv[$i]
      set -p PATH $argv[$i]
    end
  end
end

addpath "$PNPM_HOME"

addpath /opt/android-sdk/cmdline-tools/latest
addpath /opt/android-sdk/platform-tools/

addpath /var/lib/flatpak/exports/share
addpath /home/wrexes/.local/share/flatpak/exports/share
