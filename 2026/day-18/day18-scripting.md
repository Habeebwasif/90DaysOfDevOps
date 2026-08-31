# Shell Scripting: Functions & intermediate Concepts

## Task 1: Basic Functions
1. Create `functions.sh` with:
   - A function `greet` that takes a name as argument and prints `Hello, <name>!`
   - A function `add` that takes two numbers and prints their sum
   - Call both functions from the script
  
[View my Script](Scripts/functions.sh)

![snapshot](Images/functions.png)

## Task 2: Functions with Return Values
1. Create `disk_check.sh` with:
   - A function `check_disk` that checks disk usage of `/` using `df -h`
   - A function `check_memory` that checks free memory using `free -h`
   - A main section that calls both and prints the results
   
[View my Script](Scripts/disk_check.sh)
   
![snapshot](Images/diskcheck.png)

## Task 3: Strict Mode — `set -euo pipefail`
1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?

*  What does each flag do?
- `-e` - Stops if a command fails

- `-u` - Throws error if you use a variable that doesn't exist
  
- `-o` or `pipefail` → Stops if any command in a pipeline fails

[View my Script](Scripts/strict_demo.sh)
   
![snapshot](Images/strictdemo.png)

## Task 4: Local Variables
1. Create `local_demo.sh` with:
   - A function that uses `local` keyword for variables
   - Show that `local` variables don't leak outside the function
   - Compare with a function that uses regular variables
   
[View my Script](Scripts/local_demo.sh)
   
![snapshot](Images/localdemo.png)

## Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A `main` function that calls all of the above with section headers
7. Use `set -euo pipefail` at the top

[View my Script](Scripts/system_info.sh)
   
![snapshot](Images/systeminfo.png)


    
