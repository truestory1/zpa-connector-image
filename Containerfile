FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:ac61c96b93894b9169221e87718733354dd3765dd4a62b275893c7ff0d876869

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
