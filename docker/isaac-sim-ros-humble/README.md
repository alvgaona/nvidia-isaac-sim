# Isaac Sim ROS Humble

## Build the image

```sh
docker login nvcr.io
docker build --pull -t \
  nvidia-isaac-sim:4.2.0-ros-humble \
  --build-arg ISAACSIM_VERSION=4.2.0 .
```

## Run container

```sh
docker run -d --name isaac-sim --runtime=nvidia --gpus all -e "ACCEPT_EULA=Y" --rm --network=host \
  -e "PRIVACY_CONSENT=Y" \
  -v ~/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache:rw \
  -v ~/docker/isaac-sim/cache/ov:/root/.cache/ov:rw \
  -v ~/docker/isaac-sim/cache/pip:/root/.cache/pip:rw \
  -v ~/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache:rw \
  -v ~/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache:rw \
  -v ~/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs:rw \
  -v ~/docker/isaac-sim/data:/root/.local/share/ov/data:rw \
  -v ~/docker/isaac-sim/documents:/root/Documents:rw \
  nvidia-isaac-sim:4.2.0-ros-humble
```
