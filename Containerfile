FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:6d5a6576c83816edcc0da7ed62ba69df8f6ad3cbe659adde2891bfbec4dbf187

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
