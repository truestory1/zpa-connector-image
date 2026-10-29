FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:bba2b4bbf0ed15cfe7dd72a1e17ae7d2015a141f306b304e1a2785c41400e39c

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
