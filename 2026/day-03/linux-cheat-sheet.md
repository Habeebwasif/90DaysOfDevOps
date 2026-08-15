# Linux Cheat-Sheet For My Daily Use
## Process Management commands:
- `ps-aux` - detailed system-wide list of all user and system processes
- `top` - it shows real time usage of CPU, memory utilization and system uptime
- `pstree` - visualizes running processes as a tree diagram in parent-child relationships
- `pgrep` - finds processes based on name with PIDs
- `kill` - kill a process using PID (graceful shutdown)
- `&` - if added at last of the command it executes the process in the background.

## File System commands:
- `pwd` - prints the absolute path of the current working directory
- `ls` - lists the files and folders inside the current directory. ls -l for detailed long-list and ls -a for hidden files.
- `cd` - changes the active directory. `cd ~` to return to home directory
- `touch` - creates a blank text file
- `mkdir` - creates a new folder/directory. `mkdir -p` for nested directories
- `cp` - copies files or directories. `cp -r` to copy folders recursively.
- `mv` - moves or renames files and directories from one path to another.
- `rm` -  deletes files permanently. `rm -r` to erase entire folders.
- `rmdir` - deletes a directory, but **only works** if the target folder is completely empty.
- `cat` - reads and streams the full contents of a file directly to your terminal screen.
- `grep patt path/to/src` -  scans inside text files to locate specific matching words or string patterns.
- `du -h` & `df -h` - Show file/folder size on disk and Display free disk space(overall).

## Network Troubleshooting commands:
- `ping` - to check if host is alive
- `curl` - test API calls if backend unreachable
- `telnet` - test port-level connectivity if app fails to connect to DB
- `route` - diagnose and change default gateways if packets going wrong way.
