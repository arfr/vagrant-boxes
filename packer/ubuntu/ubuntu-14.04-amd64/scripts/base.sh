apt-get -y update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential dkms
apt-get -y install curl nfs-common

echo 'UseDNS no' >> /etc/ssh/sshd_config