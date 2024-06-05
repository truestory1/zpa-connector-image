FROM registry.access.redhat.com/ubi8/ubi@sha256:2a5d23450fb9b0cb266b4d465b36f1d1bc7c9b5a9b785528215b470b44f04209

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Add startup script
COPY start.sh /start.sh

# Install packages and enable services
RUN yum -y install --disableplugin=subscription-manager \
    zpa-connector \
    procps-ng && \
    yum clean all && \
    chmod +x /start.sh

CMD [ "/start.sh" ]
