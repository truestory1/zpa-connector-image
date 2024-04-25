FROM registry.access.redhat.com/ubi8/ubi

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Add startup script
COPY start.sh /start.sh

# Install packages and enable services
RUN yum -y install zpa-connector && \
    yum clean all && \
    chmod +x /start.sh

CMD [ "/start.sh" ]
