FROM centos:8
RUN yum update -y
RUN yum install -y https://resources.ovirt.org/pub/yum-repo/ovirt-release44.rpm
RUN yum update -y
RUN yum install -y 'dnf-plugins-core'
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum config-manager --set-enabled powertools
RUN yum config-manager --set-enabled epel
RUN yum module -y enable javapackages-tools
RUN yum module -y enable pki-deps
RUN yum module -y enable postgresql:12
RUN yum update -y
RUN yum install -y ovirt-engine
ADD answers.txt /answers.txt
ADD install-ovirt.sh /install-ovirt.sh
RUN chmod +x /install-ovirt.sh
ADD /install-ovirt.service /etc/systemd/system
RUN systemctl enable install-ovirt
RUN systemctl disable kdump.service
CMD ["/sbin/init"]
