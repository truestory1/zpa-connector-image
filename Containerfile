FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:30bbd445046a3a63f5f5557a3c67dee74e3c8e7855eb0347630b020f3689823f

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
