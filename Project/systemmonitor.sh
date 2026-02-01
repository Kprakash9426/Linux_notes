#!/bin/bash

# =========================
# CONFIGURABLE THRESHOLDS
# =========================
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

INTERVAL=5   # seconds between checks

# =========================
# SYSTEM INFO
# =========================
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# =========================
# ALERT FUNCTION
# =========================
send_alert() {
    echo "⚠️ ALERT on $HOSTNAME ($IP_ADDRESS): $1 usage is above threshold! Current usage: $2%"
}

# =========================
# CPU USAGE FUNCTION
# =========================
get_cpu_usage() {
    cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
    cpu_usage=$(echo "100 - $cpu_idle" | bc)
    echo ${cpu_usage%.*}
}

# =========================
# MEMORY USAGE FUNCTION
# =========================
get_memory_usage() {
    free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}'
}

# =========================
# DISK USAGE FUNCTION
# =========================
get_disk_usage() {
    df / | awk 'NR==2 {print $5}' | sed 's/%//'
}

# =========================
# MAIN MONITOR LOOP
# =========================
while true; do
    CPU=$(get_cpu_usage)
    MEM=$(get_memory_usage)
    DISK=$(get_disk_usage)

    clear
    echo "===================================="
    echo "        LINUX SYSTEM MONITOR         "
    echo "===================================="
    echo "Hostname     : $HOSTNAME"
    echo "IP Address   : $IP_ADDRESS"
    echo "------------------------------------"
    echo "CPU Usage    : $CPU%"
    echo "Memory Usage : $MEM%"
    echo "Disk Usage   : $DISK%"
    echo "===================================="

    if [ "$CPU" -ge "$CPU_THRESHOLD" ]; then
        send_alert "CPU" "$CPU"
    fi

    if [ "$MEM" -ge "$MEM_THRESHOLD" ]; then
        send_alert "Memory" "$MEM"
    fi

    if [ "$DISK" -ge "$DISK_THRESHOLD" ]; then
        send_alert "Disk" "$DISK"
    fi

    sleep "$INTERVAL"
done
