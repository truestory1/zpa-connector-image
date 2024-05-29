FROM registry.access.redhat.com/ubi8/ubi@sha256:f4292f415f60632a0ff9c0646c4fa859d8b2e1e88a16faa90c6decd1951aea88

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Add startup script
COPY start.sh /start.sh

# Install packages and enable services
RUN yum -y install --disableplugin=subscription-manager \
    zpa-connector \
    procps-ng && \
    yum clean all && \
    chmod +x /start.sh

CMD [ "/start.sh" ]
