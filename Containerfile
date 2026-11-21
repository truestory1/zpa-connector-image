FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:08d4c70f1baf6537a0728656cf7942d561e74a35916509d205b6519861266352

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Install packages and enable services
RUN microdnf -y install --disableplugin=subscription-manager \
    zpa-connector \
    procps-ng && \
    microdnf clean all

# Add startup script
COPY start.sh /start.sh

# Ensure the script is executable
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
