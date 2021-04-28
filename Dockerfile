FROM ubuntu:20.04

ENV MEMCACHED_USER=nobody
COPY ./flag.txt /root/root.txt
COPY ./start.sh /sbin/start.sh

RUN \ 
    echo "**** install required tools ****" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        vim \
        nano \
        sudo \
        locales \
        net-tools \
        python3.8 \
        openssh-server \
        memcached \
        libmemcached-tools && \
    mkdir /var/run/sshd && \
    echo 'root:<root-pass>' | chpasswd && \
    mkdir /root/.ssh && \
    chmod 400 /root/root.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    useradd -ms /bin/bash rahim && \
    echo 'rahim:<rahim-pass>' | chpasswd && \
    useradd -ms /bin/bash karim && \
    echo 'karim:<karim-pass>' | chpasswd && \
    chmod +x /sbin/start.sh


COPY ./sshd_config /etd/ssh/sshd_config

EXPOSE 22
CMD    ["/sbin/start.sh"]
