FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:f172b3082a3d1bbe789a1057f03883c1113243564f01cd3020e27548b911d3f8

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
