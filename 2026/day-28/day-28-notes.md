# Day 28 – Revision Day: Everything from Day 1 to Day 27

## What You've Covered So Far

| Days | Topic | Key Concepts |
|------|-------|-------------|
| 1 | DevOps & Cloud Intro | What is DevOps, SDLC, Cloud basics |
| 2–7 | Linux Fundamentals | Architecture, commands, processes, systemd, file system hierarchy, troubleshooting, text files |
| 8 | Cloud Server Setup | Docker, Nginx, web deployment |
| 9–11 | Users, Permissions & Ownership | User/group management, file permissions, chown/chgrp |
| 12 | Revision Day 1 | Days 1–11 recap |
| 13 | Volume Management | LVM — physical volumes, volume groups, logical volumes |
| 14–15 | Networking | Fundamentals, DNS, IP, subnets, ports, hands-on checks |
| 16–18 | Shell Scripting | Basics, loops, arguments, error handling, functions |
| 19–20 | Shell Scripting Projects | Log rotation, backup, crontab, log analyzer |
| 21 | Shell Scripting Cheat Sheet | Personal reference guide |
| 22–25 | Git & GitHub | Init, branching, merge, rebase, stash, cherry pick, reset, revert, branching strategies |
| 26 | GitHub CLI | Managing GitHub from the terminal |
| 27 | GitHub Profile | Profile README, repo organization, developer branding |

---

## Challenge Tasks

### Task 1: Self-Assessment Checklist
Go through the checklist below. For each item, mark yourself honestly:
- **Can do confidently**
- **Need to revisit**
- **Haven't done yet**

#### Linux
- [x] Navigate the file system, create/move/delete files and directories
- [x] Manage processes — list, kill, background/foreground
- [x] Work with systemd — start, stop, enable, check status of services
- [x] Read and edit text files using vi/vim or nano
- [x] Troubleshoot CPU, memory, and disk issues using top, free, df, du
- [x] Explain the Linux file system hierarchy (/, /etc, /var, /home, /tmp, etc.)
- [x] Create users and groups, manage passwords
- [x] Set file permissions using chmod (numeric and symbolic)
- [x] Change file ownership with chown and chgrp
- [x] Create and manage LVM volumes
- [x] Check network connectivity — ping, curl, netstat, ss, dig, nslookup
- [x] Explain DNS resolution, IP addressing, subnets, and common ports

#### Shell Scripting
- [x] Write a script with variables, arguments, and user input
- [x] Use if/elif/else and case statements
- [x] Write for, while, and until loops
- [x] Define and call functions with arguments and return values
- [x] Use grep, awk, sed, sort, uniq for text processing
- [x] Handle errors with set -e, set -u, set -o pipefail, trap
- [x] Schedule scripts with crontab

#### Git & GitHub
- [x] Initialize a repo, stage, commit, and view history
- [x] Create and switch branches
- [x] Push to and pull from GitHub
- [x] Explain clone vs fork
- [x] Merge branches — understand fast-forward vs merge commit
- [x] Rebase a branch and explain when to use it vs merge
- [x] Use git stash and git stash pop
- [x] Cherry-pick a commit from another branch
- [x] Explain squash merge vs regular merge
- [x] Use git reset (soft, mixed, hard) and git revert
- [x] Explain GitFlow, GitHub Flow, and Trunk-Based Development
- [x] Use GitHub CLI to create repos, PRs, and issues

---

### Task 2: Revisit Your Weak Spots

#### REVISITED Cron minute field, chown vs chmod, Git Rebase + stash indexing

Cron Minute Field:

```bash
`* 3 * * *` runs 60 times, every minute during hour 3, because the minute field is * which means "every minute", not 0.
`0 3 * * *` runs once, exactly at 3:00 AM.

Takeaway: leaving the minute field as * is a silent mistake, no error comes up, it just runs 60 times instead of once.
Need to always check the minute field is a proper number and not * when i want it to run just once a day.
```

Chown vs Chmod:

```bash
`chown` -  changes who owns the file (user/group) so it doesn't touch permissions.
`chmod` - changes what the owner/group/others can do (read/write/execute), it doesn't touch ownership.
```

Git Rebase + Stack index

```bash
Git rebase:
Understood rebase isn't moving the original commit, it's making a new one with the same changes on a different parent.

STash indexing:
Got confused earlier, so understood clearly that stash@{0} is always the newest one, and stash@{1} is the one before it.
So the numbering counts backwards from the most recent, not forwards from the oldest.
```
---

### Task 3: Quick-Fire Questions
Answer these from memory (no Googling). Then verify your answers:

Answered these from memory first, then checked myself. Noting where i got it wrong or missed something.
```
1. What does chmod 755 script.sh do?
Ans: I only mentioned execute, but understood it gives the owner full read/write/execute,
gives group + others read/execute (but not write).

2.Difference between a process and a service?
Ans: A process is just an instance of any program running right now and a service is also a process that's managed by systemd
and i control it with systemctl start/stop/enable for nginx,ssh etc

3.How do you find which process is using port 8080?
Ans: `ss -tulnp | grep :8080`

4.What does set -euo pipefail do?
Ans:
-e = stop the script right away if any command fails
-u = throw an error if i use a variable that isn't set
-o pipefail = if any part of a pipeline fails, the whole pipeline is marked as failed.

5.Difference between git reset --hard and git revert?
Ans: `reset --hard` deletes commits and rewrites history and
`revert` keeps history preserved and just adds a new commit that undoes the old one or lets say fixes the bad commit

6.Branching strategy for a team of 5 developers shipping weekly?
Ans: GitHub Flow since they're shipping it weekly.

7.What does git stash do and when would you use it?
Ans: Temporarily saves my uncommitted changes so i can switch branches cleanly like if i suddenly need to fix something
urgent on another branch then i bring my changes back later with git stash pop.

8.How do you schedule a script to run every day at 3 AM?
Ans: I answered * 3 * * *, so understood Minute has to be 0, not *, or it ends up running 60 times in that hour instead of once. Correct is 0 3 * * *.

9.Difference between git fetch and git pull?
Ans: fetch gets all the remote changes and doesn't merge them, so i can review first.
pull does fetch + merge together directly.

10.What is LVM and why would you use it over regular partitions?
Ans: LVM has a flexible storage management. We first create a physical volume (PV) (pvcreate), we combine
physical volumes into a Volume group (VG) (vgcreate) then from VG we can create slices of storage known as
Logical Volumes(LVs) which can be increased or decreased whereas, regular partition has a fixed size and
if i want to increase regular partition i need to attach a new volume and then use it.

```

### Task 4: Organize Your Work
1. [x] Make sure all your daily submissions (day-1 through day-27) are committed and pushed 
2. [x] Check that your `git-commands.md` is up to date
3. [x] Check that your shell scripting cheat sheet is complete 
4. [x] Verify your GitHub profile and repos are clean (from Day 27) 

---

### Task 5: Teach It Back

## Topic

Git branching:
```bash
- In our final year project, the four of us worked on the report together. The methodology section was already written
and agreed upon by the group which is like the "main" version everyone trusts.

- But two of us decided and wanted to try rewriting that same methodology section differently,
without messing up the version the whole group already agreed on.

- Instead of editing that shared section directly and risking a mess each of us made our own personal copy of just that
part and worked on our own rewrite separately.

- the group sat down and compared both versions and is deciding how to combine them into one final version.

- So this is exactly what "branching" is in Git. Trying different changes to the same part of a project, in parallel, without stepping
on each other's work, and then merge the good ones back in safely once everyone agrees.
```
