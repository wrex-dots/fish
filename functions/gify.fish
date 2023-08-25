function gify --description 'Turn a local or remote video file into a gif !' --a SOURCE -a NAME
    if test (count $argv) -ne 2
        return 1
    end
    string match -q '*.gif' "$NAME" || set -l NAME "$NAME.gif"
    ffmpeg -i $SOURCE -filter_complex 'split [a][b];[a] palettegen=stats_mode=single [p];[b][p] paletteuse=new=1' $NAME
end
