# Outputs of Commands:
## Process:
- `ps aux --sort=-%cpu | head -n 10` - finds the processes using the most CPU usage
- `ps aux --sort=-%mem | head -n 10` - finds the processes using the most RAM.

## System:
- `systemctl status | head -n 10` - Shows the overall status of the systemd system and displays the first 10 lines.
- `systemctl list-units --type=service --state=running | tail` - Shows the currently running systemd services and displays the last few entries.

## Logs:
- `journalctl -u ssh` - shows logs specifically for the SSH service.
- `ls /var/log` - lists the available system log files/directories.
- `tail -n 40 /var/log/kern.log` - shows the last 40 lines of the kernel log.

## One service for inspection (SSH)
- `systemctl status ssh` - SSH is active (running) and its main process is sshd with PID 1042.
- `systemctl status ssh.socket` - ssh.socket is enabled and running, listening on port 22 and is triggering ssh.service.
- `sudo journalctl -u ssh --no-pager -n 20` - The logs show SSH started successfully, is listening on port 22, and has accepted SSH connections.
