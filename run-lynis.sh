#!/bin/bash

echo "[INFO] Bắt đầu audit hệ thống bằng Lynis..."

lynis audit system --quick > lynis-result.txt

# Đếm cảnh báo nghiêm trọng
CRITICAL_WARNINGS=$(grep -Ei "\[WARNING\].*(ssh|firewall|kernel|root)" lynis-result.txt | wc -l)

if [ "$CRITICAL_WARNINGS" -gt 0 ]; then
    echo "[FAIL] Có $CRITICAL_WARNINGS cảnh báo nghiêm trọng!"

    # Gửi email (nếu muốn)
    # echo "Xem chi tiết trong file đính kèm." | mail -s "Cảnh báo bảo mật Lynis" -A lynis-result.txt your@email.com

    # Upload lên server (nếu có)
    # scp lynis-result.txt user@192.168.x.x:/log-server/

    exit 1
else
    echo "[PASS] Không có vấn đề nghiêm trọng."
    exit 0
fi
