

```sh 
docker run -d -t --gpus all --name workspace \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ${PWD}:/home/mount -p 3000:3000 -p 8888:8888 \
    thblitz/image:workspace
```