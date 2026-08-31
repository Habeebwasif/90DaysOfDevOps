#!/bin/bash

set -euo pipefail

# Function 1: System info and hostname
sys_info() {
    echo "Hostname: $(hostname)"
    echo "Kernel: $(uname -r)"
    echo "OS: $(grep -E '(NAME|VERSION)=' /etc/os-release)"
    
}

# Function 2: Uptime
show_uptime() {
    uptime
}

# Function 3: Disk usage - top 5
show_disk_usage() {
    df -h | sort -k3 -hr | head -5
}

# Function 4: Memory usage
show_memory() {
    free -h
}

# Function 5: HIGH CPU-consuming processes
show_cpu_processes() {
    ps aux --sort=-%cpu | head -6
}

# Main function
main() {

    echo "===== SYSTEM INFORMATION ====="
    sys_info

    echo ""
    echo "===== UPTIME ====="
    show_uptime

    echo ""
    echo "===== DISK USAGE ====="
    disk_usage

    echo ""
    echo "===== MEMORY USAGE ====="
    memory

    echo ""
    echo "===== HIGH CONSUMING CPU PROCESSES ====="
    cpu_processes
}
main
