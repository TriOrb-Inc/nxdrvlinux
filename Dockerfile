FROM ros:humble-ros-base

# Update debian packages
RUN apt update && apt upgrade -y

# Install debian packages
RUN apt-get install -y cmake &&\
  apt-get install -y libpciaccess-dev &&\
  apt-get install -y libnl-3-dev libnl-cli-3-dev &&\
  apt-get install -y libncurses-dev

RUN apt install -y \
    kmod \
    nano \
    ninja-build	\
    pkg-config	\
    gcc-12 \
    g++	\
    tmux \
    python3 \
    python3-argcomplete \
    python3-venv \
    python3-apt \
    python3-pip \
    python3-dev \
    python3-numpy \
    python3-matplotlib

# Set Python3 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Clean
RUN apt autoremove -y
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
