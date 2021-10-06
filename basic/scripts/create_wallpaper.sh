#!/bin/bash

function create_wallpaper() {
    local video_list=$(ls)
    local ffmpeg_args='-an -b:v 2M -maxrate 2M'

    echo -n 'Rendering videos in'
    echo $(pwd)

    for video in ${video_list[*]};
    do
        ffmpeg -i $video $ffmpeg_args no_audio_$video
    done
}

create_wallpaper
