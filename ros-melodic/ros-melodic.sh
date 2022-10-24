#!/usr/bin/bash


docker run -d -t --name ros-melodic \
    --net host \
    --gpus all \
    --env "NVIDIA_DRIVER_CAPABILITIES=all" \
    --env "DISPLAY" \
    --env "QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    thblitz/image:ros-melodic

