#!/usr/bin/env bash

xhost +local:docker

docker run -it --rm \
  --name multi_tb3_simulation_c \
  --network=host \
  -e DISPLAY=$DISPLAY \
  -e GAZEBO_MODEL_PATH="/catkin_ws/gazebo/models/" \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ./turtlebot3/turtlebot3_navigation/rviz/multi_turtlebot3_navigation.rviz:/catkin_ws/src/turtlebot3/turtlebot3_navigation/rviz/multi_turtlebot3_navigation.rviz \
  multi_tb3_simulation:noetic bash -c \
  "source /ros_entrypoint.sh && roslaunch turtlebot3_gazebo run_simulation.launch headless:=false open_rviz:=true"