FROM registry.access.redhat.com/ubi8/ubi-init@sha256:d35aff7118921a3a2c2e78507fc7329b499b8fb09d290dc60a44eea6cdeb9b5c

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Install packages and enable services
RUN yum -y install zpa-connector rsyslog && \
    yum clean all && \
    systemctl enable zpa-connector rsyslog

CMD [ "/sbin/init" ]
