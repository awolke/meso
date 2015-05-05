# Ubuntu Meso Master Node Config File
# Version 0.1

# First we need to set the Master Node ID
# Set /etc/zookeeper/conf/myid to a unique integer between 1 and 255 on each node.
sudo cp /etc/zookeeper/conf/myid ./myid.original
# add here replace comamnd based on clustermasterXX Name (grep XX) and add last digit.
sudo nano /etc/zookeeper/conf/myid

# Server - IP(s)
sudo nano /etc/zookeeper/conf/zoo.cfg
# add the following:
# server.1=clustermaster01:2888:3888
# server.2=clustermaster02:2888:3888
# server.3=clustermaster03:2888:3888

# Start Zookeeper
# sudo service zookeeper start

# Stop Zookeeper
# sudo service zookeeper stop

# Restart Zookeeper
sudo service zookeeper restart

# Configure Mesos & Marathon
sudo nano /etc/mesos/zk
zk://192.168.12.202:2181,192.168.12.201:2181,192.168.12.230:2181/mesos

# Set /etc/mesos-master/quorum on each master node to a number greater than the number of masters divided by 2
sudo nano /etc/mesos-master/quorum
# for a 3 Master Cluster set it to "2"

# Disable mesos-slave service
sudo service mesos-slave stop
# get always error with the above command - not existing service - need to check later
sudo sh -c "echo manual > /etc/init/mesos-slave.override"

# Start Services:
# You need to bring each service up on the set of master nodes at roughly the same time. Bring up Mesos master:
sudo service mesos-master restart
sudo service marathon restart
