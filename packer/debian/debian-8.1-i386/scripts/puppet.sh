wget https://apt.puppetlabs.com/puppetlabs-release-jessie.deb
dpkg -i puppetlabs-release-jessie.deb
rm puppetlabs-release-jessie.deb

apt-get -y update

apt-get -y install puppet-common