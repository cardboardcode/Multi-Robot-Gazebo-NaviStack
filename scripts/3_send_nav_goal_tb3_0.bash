#!/usr/bin/env bash

docker exec -it multi_tb3_simulation_c bash -c "source /ros_entrypoint.sh && rostopic pub /tb3_0/move_base_simple/goal geometry_msgs/PoseStamped '{header: {seq: 0, stamp: {secs: 63, nsecs: 726000000}, frame_id: "map"}, pose: {position: {x: -3.9837591648101807, y: -4.950556755065918, z: 0.0}, orientation: {x: 0.0, y: 0.0, z: 0.7133038193389906, w: 0.7008549502688902}}}' -1"
