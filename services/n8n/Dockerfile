# Use the Debian-based n8n image
FROM docker.n8n.io/n8nio/n8n

USER root

# Install tools using apt-get
RUN apk --update add \
    curl \
    ffmpeg \
    jq \
    bash \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER node
