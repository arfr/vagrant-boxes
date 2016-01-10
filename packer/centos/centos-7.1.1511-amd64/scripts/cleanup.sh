yum -y remove gcc cpp kernel-devel kernel-headers perl
yum -y clean all

rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo

passwd -l root

rm -rf /var/mail/* > /dev/null 2>&1
rm -rf /var/lib/dhcp/* > /dev/null 2>&1

rm -rf /dev/.udev/
rm -rf /etc/udev/rules.d/70-persistent-net.rules
rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules

mkdir /etc/udev/rules.d/70-persistent-net.rules

cat << 'EOF' > /etc/init.d/ssh_gen_host_keys
#!/bin/sh
### BEGIN INIT INFO
# Provides: Generates new ssh host keys on first boot
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop:
# Short-Description: Generates new ssh host keys on first boot
# Description: Generates new ssh host keys on first boot
### END INIT INFO
rm -f /etc/ssh/ssh_host_*

ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -N ""
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -t dsa -N ""
chkconfig --del /etc/init.d/ssh_gen_host_keys

rm -f /etc/init.d/ssh_gen_host_keys
EOF

chmod a+x /etc/init.d/ssh_gen_host_keys
chkconfig --add /etc/init.d/ssh_gen_host_keys

if [ -r /etc/sysconfig/network-scripts/ifcfg-eth0 ]; then
  sed -i 's/^HWADDR.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
  sed -i 's/^UUID.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
fi

rm -rf /tmp/*

rm -rf /usr/src/virtualbox-ose-guest*
rm -rf /usr/src/vboxguest*

date > /home/vagrant/.built_date
