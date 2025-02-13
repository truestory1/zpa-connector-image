FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:14f14e03d68f7fd5f2b18a13478b6b127c341b346c86b6e0b886ed2b7573b8e0

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
