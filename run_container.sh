#!bin/bash

docker run -it --rm --name cifx --privileged --net=host --ipc=host --pid=host --cap-add=ALL \
                -v /dev:/dev \
                -v /lib/modules:/lib/modules \
                -v /sys/devices/:/sys/devices/ \
                -v /etc/NetworkManager/system-connections:/etc/NetworkManager/system-connections \
                -v /var/run/dbus:/var/run/dbus \
                -v $(pwd):/ws \
                -w /ws \
                triorb/ros2/cifx:humble /bin/bash -c 'sh ./build_install_driver -y&& /bin/bash'
