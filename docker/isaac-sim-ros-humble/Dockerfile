ARG ISAACSIM_VERSION=4.1.0
FROM nvcr.io/nvidia/isaac-sim:${ISAACSIM_VERSION} AS isaac-sim

LABEL version=0.1.0
LABEL maintainer=alvgaona@gmail.com
LABEL rmw=fastrtps

ARG PYTHON_VERSION=3.10.14

WORKDIR /isaac-sim

SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    git build-essential gcc \
    make libssl-dev zlib1g-dev \
    liblzma-dev \
    libbz2-dev libreadline-dev \
    libsqlite3-dev libncurses5-dev \
    libncursesw5-dev xz-utils

WORKDIR /

RUN curl https://pyenv.run | bash
RUN curl -fsSL https://pixi.sh/install.sh | bash

ENV PATH /root/.pyenv/bin:/root/.pyenv/shims:/root/.pixi/bin:$PATH

RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

COPY . /ros-humble

WORKDIR /ros-humble

RUN pixi install
RUN pixi shell-hook > ./shell-hook.sh
RUN echo 'exec "$@"' >> ./shell-hook.sh

WORKDIR /

COPY entrypoint.sh .

ENV RMW_IMPLEMENTATION rmw_fastrtps_cpp
ENV FASTRTPS_DEFAULT_PROFILES_FILE /ros-humble/fastdds.xml
ENV PATH $PATH:/isaac-sim/exts/omni.isaac.ros2_bridge/humble/lib
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/isaac-sim/exts/omni.isaac.ros2_bridge/humble/lib

ENTRYPOINT ["/entrypoint.sh"]
