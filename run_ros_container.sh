#!bin/bash

docker run -it --rm --name cifx --privileged --net=host --ipc=host --pid=host --cap-add=ALL \
                --add-host=localhost:127.0.1.1 \
                -e ROS_LOCALHOST_ONLY=$(cat /triorb/params/ROS_LOCALHOST_ONLY) \
                -e ROS_DOMAIN_ID=$(cat /triorb/params/ROS_DOMAIN_ID) \
                -e ROS_PREFIX=$(cat /triorb/params/ROS_PREFIX) \
                -v /opt/cifx:/opt/cifx \
                -v /triorb:/triorb \
                -v /dev:/dev \
                -v /lib/modules:/lib/modules \
                -v $(readlink /lib/modules/$(uname -r)/build):$(readlink /lib/modules/$(uname -r)/build) \
                -v /sys/devices/:/sys/devices/ \
                -v /var/run/dbus:/var/run/dbus \
                -v $(pwd):/ws \
                -w /ws \
                triorb/cifx:latest /bin/bash