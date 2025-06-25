FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:e12131db2e2b6572613589a94b7f615d4ac89d94f859dad05908aeb478fb090f

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
