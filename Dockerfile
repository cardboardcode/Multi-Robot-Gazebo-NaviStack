FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash", "-c"]

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      ros-noetic-dwa-local-planner \
      python3-vcstool \
      nano \
      wget \
      git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /catkin_ws/src
COPY turtlebot3 turtlebot3
COPY turtlebot3_msgs turtlebot3_msgs
COPY turtlebot3_gazebo turtlebot3_gazebo
WORKDIR /catkin_ws/
RUN mkdir gazebo
RUN git clone https://github.com/osrf/gazebo_models.git --depth 1 --single-branch --branch master gazebo/models
RUN cp -r src/turtlebot3_gazebo/models/CloseArea2 gazebo/models/
COPY multi_tb3.repos multi_tb3.repos
RUN vcs import src < multi_tb3.repos
RUN rm -r src/turtlebot3_simulations/turtlebot3_gazebo
RUN apt-get update && rosdep install --from-paths src --ignore-src --rosdistro=noetic -y
RUN . /opt/ros/noetic/setup.bash && catkin_make

RUN sed -i '$isource "/catkin_ws/devel/setup.bash"' /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]

