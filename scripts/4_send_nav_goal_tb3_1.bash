#!/usr/bin/env bash

docker exec -it multi_tb3_simulation_c bash -c "source /ros_entrypoint.sh && rostopic pub /tb3_1/move_base_simple/goal geometry_msgs/PoseStamped '{header: {seq: 0, stamp: {secs: 63, nsecs: 726000000}, frame_id: "map"}, pose: {position: {x: 4.024593353271484, y: -4.987910270690918, z: 0.0}, orientation: {x: 0.0, y: 0.0, z: 0.7044893773226218, w: 0.7097145322167108}}}' -1"
