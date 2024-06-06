FROM registry.access.redhat.com/ubi8/ubi@sha256:143123d85045df426c5bbafc6863659880ebe276eb02c77ee868b88d08dbd05d

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
