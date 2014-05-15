echo 'UseDNS no' >> /etc/ssh/sshd_config

yum -y update
yum -y install gcc make gcc-c++ kernel-headers kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel
yum -y install nfs-utils wget dkms perl acpid

wget -O /etc/pki/tls/certs/ca-bundle.crt http://curl.haxx.se/ca/cacert.pem