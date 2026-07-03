FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:463cae32c6f6f5594b11a5c22de275016bd8545ce58a6373388e8b24f13fc15c

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
