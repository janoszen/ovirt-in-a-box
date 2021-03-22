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
RUN systemctl disable kdump.service
RUN systemctl disable auditd.service
RUN systemctl disable systemd-hostnamed.service
RUN yum install -y cockpit-ovirt-dashboard
RUN systemctl enable cockpit.socket
RUN yum install -y passwd
RUN echo "ovirt" | passwd root --stdin
CMD ["/sbin/init"]
HEALTHCHECK --start-period=600s CMD curl --fail http://localhost:9090 || exit 1
