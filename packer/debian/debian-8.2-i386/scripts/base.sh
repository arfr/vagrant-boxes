apt-get -y update
apt-get -y install linux-headers-$(uname -r) build-essential dkms
apt-get -y install curl sudo nfs-common

echo 'UseDNS no' >> /etc/ssh/sshd_config