if test -f /home/vagrant/.vbox_version; then

  if test -f /etc/init.d/virtualbox-guest-utils; then
    /etc/init.d/virtualbox-guest-utils stop
  fi

  rmmod vboxguest
  aptitude -y purge virtualbox-guest-x11 virtualbox-guest-dkms virtualbox-guest-utils

  # modinfo vboxguest
  VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
  VBOX_ISO=/home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso

  mount -o loop $VBOX_ISO /mnt
  yes | sh /mnt/VBoxLinuxAdditions.run
  umount /mnt

  rm -f $VBOX_ISO

fi

# BUGFIX: https://www.virtualbox.org/ticket/12879
ln -s /opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions