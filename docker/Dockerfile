FROM amazonlinux:2023

# Install system dependencies
RUN dnf update -y && dnf install -y \
    git \
    tar \
    gzip \
    unzip \
    python3 \
    python3-pip \
    docker \
    jq \
    shadow-utils \
    && dnf clean all

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

# Enable Docker inside the container
RUN usermod -aG docker root

# Set working directory
WORKDIR /build

# Default command
CMD ["/bin/bash"]
