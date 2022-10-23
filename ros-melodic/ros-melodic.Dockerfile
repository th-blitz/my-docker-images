
FROM ubuntu:bionic

RUN apt-get update
RUN apt-get upgrade -y

RUN apt install lsb-core -y

RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN apt install ros-melodic-desktop-full -y 

RUN apt install ros-melodic-turtlebot3 ros-melodic-turtlebot3-simulations ros-melodic-gmapping python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential x11-apps gnome-terminal -y

SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && source ~/.bashrc

