#!bin/bash
apt list --installed | grep nvidia-l4t-kernel-headers > /dev/null
if [ $? -ne 0 ]; then
  echo 'sudo apt update && sudo apt install nvidia-l4t-kernel-headers'
fi

docker run -it --rm --name cifx --privileged --net=host --ipc=host --pid=host --cap-add=ALL \
                -v /dev:/dev \
                -v /lib/modules:/lib/modules \
                -v $(readlink /lib/modules/$(uname -r)/build):$(readlink /lib/modules/$(uname -r)/build) \
                -v /sys/devices/:/sys/devices/ \
                -v /var/run/dbus:/var/run/dbus \
                -v $(pwd):/ws \
                -w /ws \
                triorb/cifx:latest /bin/bash -c 'sh ./build_install_driver -y&& /bin/bash'
