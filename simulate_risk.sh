#!/bin/bash
echo "Sensitive data" > /tmp/sensitive.conf
chmod 777 /tmp/sensitive.conf
useradd -m weakuser
echo "weakuser:123456" | chpasswd
echo "Simulated risks: sensitive.conf with 777 permissions and weakuser with weak password"