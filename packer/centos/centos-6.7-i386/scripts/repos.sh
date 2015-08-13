# FIX: http://hobodave.com/2011/02/10/fixing-epel-primary-sqlite-database-not-found/
# FIX-2: http://www.6tech.org/2013/01/centos-6-3-yum-repos-returning-error-404/
echo "exclude=servercentral.net, .gov, facebook" >> /etc/yum/pluginconf.d/fastestmirror.conf
yum clean all

cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM
