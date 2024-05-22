FROM registry.access.redhat.com/ubi8/ubi@sha256:a424544997de1960a93466b57d12f1f3fac62be0f4cd35482435bae305a6ca27

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
