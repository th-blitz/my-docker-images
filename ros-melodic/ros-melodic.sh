#!/usr/bin/bash

ImageName="ros-melodic"
docker build -t $ImageName -f $ImageName.Dockerfile . 
docker run -d -t --name $ImageName \
    --net host \
    --gpus all \
    --env "NVIDIA_DRIVER_CAPABILITIES=all" \
    --env "DISPLAY" \
    --env "QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    $ImageName

