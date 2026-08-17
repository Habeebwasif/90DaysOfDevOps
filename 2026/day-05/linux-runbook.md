# Linux Troubleshooting Runbook- SSH

## Environment Basics:
* `uname -a`
  - `Output`- Linux habeeb 7.0.0-1006-aws #6-Ubuntu SMP PREEMPT Tue May 26 12:04:34 UTC 2026 x86_64 GNU/Linux
  - `Observation`- The server is running a 64-bit Ubuntu AWS kernel (7.0.0-1006-aws) on an EC2 environment

* `lsb_release -a`
  - `Output` - No LSB modules are available, Distributor ID: Ubuntu, Description:    Ubuntu 26.04 LTS, Release:        26.04, Codename:       resolute
  - `Observation` - No LSB modules are installed, which is normal and does not affect the SSH service.

## Filesystem sanity:
* `mkdir /tmp/runbook-demo` & `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`
  - `Output` - Total 4 rw-r--r-- 1 ubuntu ubuntu 221 Aug 17 16:41 hosts-copy
  - `Observation`- Successfully created /tmp/runbook-demo and copied /etc/hosts into it.
  The file exists and is readable, confirming that basic filesystem operations are working normally.

## CPU / Memory:
* `ps -o pid,pcpu,pmem,comm -p $(pidof sshd)`
  - `Output` - PID %CPU %MEM COMMAND 1031  0.0  0.8 sshd
  - `Observation` -  Process running and CPU & Memory usage is negligible.
* `free -h`
  - `Output` -                total        used        free      shared  buff/cache   available
Mem:                          908Mi       331Mi       318Mi       2.7Mi       368Mi       577Mi
Swap:                           0B          0B          0B
  - `Observation` - The server has 908 MiB of RAM, with 577 MiB available. No swap is configured. Current memory usage does not indicate memory pressure.

## Disk / IO:
* `df -h`
  - `Output` - Filesystem       Size  Used Avail Use% Mounted on
/               dev/root         19G  2.1G   17G  12% /
  - `Observation` - Only 12% used and approximately 17 GB available. No disk-space pressure is observed.
* `vmstat`
  - `Output` -   r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st gu
 2  0      0 326276  17732 359504    0    0   128   175   91    0  0  0 99  0  0  0
  - `Observation` - CPU is 99% idle with no blocked processes or swap activity.

## Network:
* `ss -tlnp | grep :22`
  - `Output` - See in /images
  - `Observation` - SSH is listening on TCP port 22 on all IPv4 and IPv6 interfaces.The service is reachable at the socket level.
* `ip route` -
  - `Output` - default via 172.31.0.1 dev ens5 proto dhcp src 172.31.1.138 metric 100
172.31.0.0/20 dev ens5 proto kernel scope link src 172.31.1.138 metric 100
172.31.0.1 dev ens5 proto dhcp scope link src 172.31.1.138 metric 100
172.31.0.2 dev ens5 proto dhcp scope link src 172.31.1.138 metric 100
  - `Observation` - The server has a valid route to the 172.31.0.0/20 subnet and a default route through 172.31.0.1 via ens5.
    Network routing appears normal. `ens5` = the name Linux gives to a network interface.
 
## Logs:
* `journalctl -u <service> -n 50` or `journalctl -u ssh -n 50`
  - `Output` - See in /images
  - `Observation` - SSH started successfully and is listening on port 22 over IPv4 and IPv6. Multiple public-key authentications for the ubuntu user were successful. Several external connections were closed before authentication,
  which can occur from unsolicited Internet traffic. No SSH service failure is visible in these logs.
* `tail -n 50 /var/log/<file>.log` or `sudo tail -n 50 /var/log/auth.log` 
  - `Output` - Shows last 50 lines of code of auth.log file.
  - `Observation` - Normal system activity.

## Overall Review:
- SSH service is healthy: SSH is active and listening on port 22 over both IPv4 and IPv6.
- System resources are healthy: CPU is 99% idle, memory has ~577 MiB available, and disk usage is only 12%.
- Network and filesystem are healthy: Routing is configured correctly, ens5 is active, and basic file operations completed successfully.
- Logs show normal SSH activity.

## If this worsens:
- SSH down: Check logs/config, then restart the service.
- High CPU/RAM/Disk: Find the cause and free resources.
- SSH connection failure: Check port 22, network, and firewall.
- Suspicious logins: Review logs and restrict unauthorized access.
