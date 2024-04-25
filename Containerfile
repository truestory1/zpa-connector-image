FROM registry.access.redhat.com/ubi8/ubi-init

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Install packages and enable services
RUN yum -y install zpa-connector rsyslog && \
    yum clean all && \
    systemctl enable zpa-connector rsyslog

CMD [ "/sbin/init" ]
