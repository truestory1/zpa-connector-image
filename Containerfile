FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:d235f607e1d6d833f031db107dc42206e4dd4d5aa9142c43d3771fb7f9bea76a

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
