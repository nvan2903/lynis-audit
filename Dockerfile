FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    git \
    sudo \
    mailutils \
    python3 \
    python3-pip \
    curl

# Cài đặt thư viện Python để phân tích kết quả
RUN pip3 install matplotlib

# Tải Lynis từ GitHub (CISOfy)
RUN git clone https://github.com/CISOfy/lynis.git /opt/lynis

# Tạo alias để có thể gọi 'lynis' từ bất kỳ đâu
RUN ln -s /opt/lynis/lynis /usr/bin/lynis

# Thiết lập thư mục làm việc
WORKDIR /audit

# Copy các script vào container
COPY run-lynis.sh .
COPY simulate_risk.sh .
COPY analyze_lynis.py .

# Cấp quyền thực thi
RUN chmod +x run-lynis.sh simulate_risk.sh analyze_lynis.py

# CMD mặc định
CMD ["./run-lynis.sh"]

