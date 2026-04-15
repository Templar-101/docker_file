FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    openssh-server sudo python3 python3-pip curl vim && apt-get clean
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /var/run/sshd && chmod 0755 /var/run/sshd
RUN mkdir -p /home/ansible/.ssh && chmod 700 /home/ansible/.ssh && chown ansible:ansible /home/ansible/.ssh
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
