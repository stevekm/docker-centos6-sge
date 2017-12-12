# SGE container
# for testing apps that interface with SGE
# designed to mimic SGE installation on phoenix HPC cluster at NYULMC
# http://sysadm.mielnet.pl/grid-engine-installation-on-centos-6/
# https://github.com/gawbul/docker-sge/blob/master/Dockerfile

FROM centos:6

MAINTAINER Stephen M. Kelly

# user account to use with SGE
# ENV sge_user="sge001"

# make sure the package repository is up to date
# RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update

# install required dependencies
# RUN apt-get update
RUN yum update
RUN yum install -y wget

RUN cd /tmp; for i in gridengine-8.1.9-1.el6.x86_64.rpm gridengine-debuginfo-8.1.9-1.el6.x86_64.rpm gridengine-devel-8.1.9-1.el6.noarch.rpm gridengine-drmaa4ruby-8.1.9-1.el6.noarch.rpm gridengine-execd-8.1.9-1.el6.x86_64.rpm gridengine-guiinst-8.1.9-1.el6.noarch.rpm gridengine-qmaster-8.1.9-1.el6.x86_64.rpm gridengine-qmon-8.1.9-1.el6.x86_64.rpm; do wget https://arc.liv.ac.uk/downloads/SGE/releases/8.1.9/$i;done

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

RUN yum install -y perl-Env.noarch perl-Exporter.noarch perl-File-BaseDir.noarch perl-Getopt-Long.noarch perl-libs perl-POSIX-strptime.x86_64 perl-XML-Simple.noarch jemalloc munge-libs hwloc lesstif csh ruby xorg-x11-fonts xterm java xorg-x11-fonts-ISO8859-1-100dpi xorg-x11-fonts-ISO8859-1-75dpi mailx


RUN cd /tmp/ && yum localinstall -y gridengine-*

# this part has interactive stuff figure out how to avoid
# RUN cd /opt/sge && ./install_qmaster
# try it from here
# https://github.com/gawbul/docker-sge/blob/master/Dockerfile







# # RUN yum install -y gridengine-master gridengine-exec gridengine-common gridengine-qmon gridengine-client
# # RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y gridengine-master gridengine-exec gridengine-common gridengine-qmon gridengine-client
# RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y sudo
# # RUN apt-get -y install python python-virtualenv python-pip
#
# # setup 'sge001' user for
# RUN useradd $sge_user --create-home
# RUN adduser $sge_user sudo
#
# # setup host information
# ADD exec_host /exec_host
#
# # Set maximum of available memory - this is avaiable memory - 1GB
# RUN sed -i "s|complex_values        NONE|complex_values        h_vmem=`grep 'MemTotal' /proc/meminfo | awk '{print ($2 - 1000000)}'`k|g" /exec_host
#
# # add hosts data
# ADD host_group_entry /host_group_entry
# ADD queue /queue
#
#
# USER root
# # add job test script
# ADD test.sh /test.sh
# RUN chmod +x /test.sh
# # add startup script
# ADD run.sh /root/run.sh
# RUN chmod +x /root/run.sh
#
# # Container Startup Commands; configure SGE with hostname & useraccount at runtime
# CMD bash -C '/root/run.sh' "$sge_user"; bash
