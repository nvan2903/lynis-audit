FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python3 \
    python3-pip \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Python libraries for analysis
RUN pip3 install matplotlib numpy

# Clone Lynis from GitHub (CISOfy)
RUN git clone https://github.com/CISOfy/lynis.git /opt/lynis

# Create alias to call 'lynis' from anywhere
RUN ln -s /opt/lynis/lynis /usr/bin/lynis

# Set up working directory
WORKDIR /audit

# Copy scripts into container
COPY run-lynis.sh .
COPY simulate_risk.sh .
COPY analyze_lynis.py .

# Make scripts executable
RUN chmod +x run-lynis.sh simulate_risk.sh analyze_lynis.py

# Default command
CMD ["./run-lynis.sh"]

