FROM node:8.9.4

RUN mkdir /opt/app
COPY . /opt/app
COPY sshd_config /etc/ssh/

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
        vim \
    && echo "root:Docker!" | chpasswd \
    && cd /opt/app \
    && npm install \
    && chmod 755 /opt/app/init_container.sh

EXPOSE 2222 8080

ENV PORT 8080
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/opt/app

WORKDIR /opt/app

ENTRYPOINT ["/opt/app/init_container.sh"]