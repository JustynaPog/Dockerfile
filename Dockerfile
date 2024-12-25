FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/app

RUN apt-get update && \

    apt-get install -y \
    software-properties-common \
    curl \
    gnupg
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \

    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y packer && \
    rm -rf /var/lib/apt/lists/*

RUN apt-add-repository --yes --update ppa:ansible/ansible && \

    apt-get update && \
    apt-get install -y ansible && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -rm -d /home/packer -s /bin/bash -g root -G sudo -u 111 packer
USER packer

CMD ["/bin/bash"]
