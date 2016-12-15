#! /bin/bash
echo > /etc/sysctl.conf
cat >> /etc/sysctl.conf << EOF
#Kernel paramaters required by PostgreSql
kernel.shmmni = 4096
kernel.sem = 50100 64128000 50100 1280
fs.file-max = 7672460
net.ipv4.ip_local_port_range = 9000 65000
net.core.rmem_default = 1048576
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048576
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_max_syn_backlog = 4096
net.core.netdev_max_backlog = 10000
vm.overcommit_memory = 0
fs.aio-max-nr = 1048576
net.ipv4.tcp_timestamps = 0
EOF

sysctl -p
