FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:c0e70387664f30cd9cf2795b547e4a9a51002c44a4a86aa9335ab030134bf392

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
