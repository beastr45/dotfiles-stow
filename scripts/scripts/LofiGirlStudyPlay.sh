#!/bin/bash

#sometimes it may be necessary to update url
url='https://www.youtube.com/watch?v=jfKfPfyJRdk'
# echo $url
exec mpv --no-terminal --volume=70 --no-video "$url" 2>/dev/null
