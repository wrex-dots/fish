function clip --description 'Extract a clip from a media file' --argument SOURCE START END NAME
    if test (count $argv) -ne 4
        return 1
    end
    ffmpeg -ss $START -to $END -i $SOURCE -vcodec copy -acodec copy $NAME
end
