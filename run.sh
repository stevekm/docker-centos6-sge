
/etc/init.d/gridengine-master start
/etc/init.d/gridengine-exec start
sudo -u sgeadmin qconf -am sge001
sudo -u sge001 qconf -au sge001 users
sudo -u sge001 qconf -Ae /exec_host
sudo -u sge001 qconf -Ahgrp /host_group_entry
sudo -u sge001 qconf -aattr hostgroup hostlist sgeserver @allhosts
sudo -u sge001 qconf -Aq /queue
sudo -u sge001 qconf -aattr queue hostlist @allhosts main.q
sudo -u sge001 qconf -as sgeserver

# set maximum of avaiable CPU's
sed -i "s|processors            4|processors            `num=$(grep ^processor /proc/cpuinfo | wc -l) && echo $((num-1))`|g" /queue
sed -i "s|slots                 4|slots                 `num=$(grep ^processor /proc/cpuinfo | wc -l) && echo $((num-1))`|g" /queue
