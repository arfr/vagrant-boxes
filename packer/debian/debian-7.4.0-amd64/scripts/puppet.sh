wget https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
rm puppetlabs-release-wheezy.deb

apt-get -y update

apt-get -y install puppet-common