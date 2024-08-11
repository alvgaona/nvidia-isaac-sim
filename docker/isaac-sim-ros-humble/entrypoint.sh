#!/bin/bash

source /ros-humble/shell-hook.sh
./isaac-sim/isaac-sim.headless.native.sh --allow-root -- /isaac/startup/ros_bridge_extension=omni.isaac.ros2_bridge > /var/log/isaac-sim.log 2>&1
