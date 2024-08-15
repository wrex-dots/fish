set -gx fish_abbreviations (status --current-filename)

if not set -q EDITOR
  command -q nvim     && set EDITOR nvim
  or command -q vim   && set EDITOR vim
  or command -q vi    && set EDITOR vi
  or command -q nano  && set EDITOR nano
  or command -q emacs && set EDITOR emacs # why
end

function editabbr --description 'Edit your Fish abbreviations file' --wraps $EDITOR
  $EDITOR $argv $fish_abbreviations
end

abbr -a ls 'exa'

abbr -a +x 'chmod +x'
abbr -a \- 'cd -'

abbr -a cp. 'cp -at.'
abbr -a cpat 'cp -at'
abbr -a rmr 'rm -r'
abbr -a rmrf 'rm -rf'

abbr -a diff 'colordiff'
abbr -a dyff 'colordiff -y'

abbr -a jcat 'jq .'

abbr -a iv 'nsxiv -a'

abbr -a gcb 'gcc -ggdb3 -rdynamic -Wall -Wextra -iquote ./include'
abbr -a gco 'git checkout'
abbr -a gcw 'gcc -Wall -Wextra'
abbr -a gcx 'gcc -Wall -Wextra -Werror -iquote ./include'

abbr -a mre 'make re'
abbr -a mtest 'make tests'
abbr -a mfclean 'make fclean'

abbr -a clone 'git clone'
abbr -a fetch 'git fetch --all'
abbr -a gdiff 'git diff'
abbr -a rebase 'git rebase'
abbr -a remotes 'git remote -v'
abbr -a rpush 'for rem in (git remote); git push --all $rem; end'
abbr -a plog 'git pretty-log'
abbr -a stash 'git stash'
abbr -a splog 'git short-pretty-log'
abbr -a gls 'git ls-files'
abbr -a glt 'git ls-tree'

abbr -a yarnx 'yarn exec'

abbr -a start 'sudo systemctl start'
abbr -a stop 'sudo systemctl stop'

abbr -a vi 'nvim'
abbr -a . '$EDITOR'

abbr -a xopen 'xdg-open'

abbr -a xtar 'tar -xvf'
abbr -a xztar 'tar -xzvf'

abbr -a dl 'yt-dlp -o "%(title)s.%(ext)s"'
abbr -a dl:discord 'yt-dlp -o "%(title)s.%(ext)s" -S vcodec:h264 -S acodec:aac'
abbr -a dl:tmp 'yt-dlp -o (mktemp -u)".%(ext)s"'
abbr -a dl:wav 'yt-dlp -o "%(title)s.%(ext)s" --format bestaudio -x --audio-format wav'

abbr -a zat 'zaread'
