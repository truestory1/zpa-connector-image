FROM registry.access.redhat.com/ubi8/ubi@sha256:edc34f89cf9c818c2fb28b8ea1780f384db563ce4293dc0ab8e73ec01791e5af

# Add repositories
COPY zscaler.repo /etc/yum.repos.d/

# Add startup script
COPY start.sh /start.sh

# Install packages and enable services
RUN yum -y install zpa-connector procps-ng && \
    yum clean all && \
    chmod +x /start.sh

CMD [ "/start.sh" ]
