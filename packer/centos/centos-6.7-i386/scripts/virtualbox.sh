if test -f /root/.vbox_version; then

  VBOX_VERSION=$(cat /root/.vbox_version)
  VBOX_ISO=/root/VBoxGuestAdditions_$VBOX_VERSION.iso

  mount -o loop $VBOX_ISO /mnt
  yes | sh /mnt/VBoxLinuxAdditions.run
  umount /mnt

  rm -f $VBOX_ISO

  # BUGFIX: https://www.virtualbox.org/ticket/12879
  ln -s /opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

fi