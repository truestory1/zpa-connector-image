FROM registry.access.redhat.com/ubi8/ubi-minimal@sha256:5f1cd3422d5d46aea35dac80825dbcbd58213eef49c317f42a394345fb4e8ff1

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Add startup script
COPY start.sh /start.sh

# Install packages and enable services
RUN microdnf -y install --disableplugin=subscription-manager \
    zpa-connector \
    procps-ng && \
    microdnf clean all && \
    chmod +x /start.sh

CMD [ "/start.sh" ]
