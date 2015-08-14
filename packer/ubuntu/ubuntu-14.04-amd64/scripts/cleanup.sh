apt-get -y --purge remove linux-headers-$(uname -r) build-essential
apt-get -y --purge autoremove
apt-get -y clean

rm -rf /var/mail/* > /dev/null 2>&1
rm -rf /var/lib/dhcp/* > /dev/null 2>&1

rm -rf /dev/.udev/
rm -rf /etc/udev/rules.d/70-persistent-net.rules
rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules

mkdir /etc/udev/rules.d/70-persistent-net.rules

echo "pre-up sleep 2" >> /etc/network/interfaces

rm -rf /tmp/*

rm -rf /usr/src/virtualbox-ose-guest*
rm -rf /usr/src/vboxguest*

date > /home/vagrant/.built_date

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY