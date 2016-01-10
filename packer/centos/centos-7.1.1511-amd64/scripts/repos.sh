# FIX: http://hobodave.com/2011/02/10/fixing-epel-primary-sqlite-database-not-found/
echo "exclude=servercentral.net, .gov, facebook" >> /etc/yum/pluginconf.d/fastestmirror.conf
yum clean all

cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=\$basearch
enabled=1
gpgcheck=0
EOM
