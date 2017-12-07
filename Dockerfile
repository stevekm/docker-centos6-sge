# SGE container
# for testing apps that interface with SGE
# designed to mimic SGE installation on phoenix HPC cluster at NYULMC

FROM debian:wheezy

MAINTAINER Stephen M. Kelly

# make sure the package repository is up to date
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update

# install required dependencies
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y gridengine-master gridengine-exec gridengine-common gridengine-qmon gridengine-client
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y sudo
# RUN apt-get -y install python python-virtualenv python-pip

# setup 'sge001' user for
RUN useradd sge001 --create-home
RUN adduser sge001 sudo

# setup host information
ADD exec_host /exec_host

# Set maximum of available memory - this is avaiable memory - 1GB
RUN sed -i "s|complex_values        NONE|complex_values        h_vmem=`grep 'MemTotal' /proc/meminfo | awk '{print ($2 - 1000000)}'`k|g" /exec_host


ADD host_group_entry /host_group_entry
ADD queue /queue

USER root
ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

# Startup Commands
CMD bash -C '/root/run.sh';'bash'
