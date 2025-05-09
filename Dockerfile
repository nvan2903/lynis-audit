FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    git \
    lynis=3.0.9 \
    sudo \
    mailutils \
    python3 \
    python3-pip \
    curl

# Cài đặt thư viện Python để phân tích kết quả
RUN pip3 install matplotlib

# Thư mục làm việc
WORKDIR /audit

# Copy các file script vào container
COPY run-lynis.sh .
COPY simulate_risk.sh .
COPY analyze_lynis.py .

# Cấp quyền thực thi
RUN chmod +x run-lynis.sh simulate_risk.sh

# CMD mặc định
CMD ["./run-lynis.sh"]

