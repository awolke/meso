# Tis is a Master Node Installer Script for Ubuntu Server 14.04
# The Commands are a auto-pull collection of the Install Guide 
# from https://docs.mesosphere.com/getting-started/datacenter/install/
# Verson 0.1

# Creating Key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list

# Updating Repos
sudo apt-get update -y

# Installing Meso & Marathon (Zookeeper is also installed with the Ubuntu setup)
sudo apt-get -y install mesosphere
