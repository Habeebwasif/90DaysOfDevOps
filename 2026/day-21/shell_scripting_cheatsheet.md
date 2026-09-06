# Shell Scripting Cheatsheet

A practical reference for Bash scripting — basics, conditionals, loops, functions, text processing, one-liners, and debugging.

## Task 1: Basics

### 1. Shebang (`#!/bin/bash`)

The first line of a script. Tells the OS which interpreter to use to run the file, regardless of the user's current shell.

```bash
#!/bin/bash
echo "Hello, world!"
```

### 2. Running a script

```bash
chmod +x script.sh     # Make the script executable
./script.sh            # Runs it
bash script.sh         # Runs it directly with bash 
sh script.sh           # Runs it with the default shell interpreter
```

### 3. Comments

```bash
# This is a full-line comment
echo "Hello"   # This is an inline comment
```

### 4. Variables

```bash
NAME="Habeeb"           # Declare (no spaces around =)
```

- **`"$VAR"` (double quotes)**: variable is expanded, but treated as a single word — safest default.
- **`'$VAR'` (single quotes)**: no expansion at all; printed literally as `$VAR`.

```bash
echo "Hello, $NAME!"        # Hello, Habeeb!
echo 'Hello, $NAME!'        # Hello, $NAME!
```

### 5. Reading user input

```bash
read -p "Enter your name: " NAME
echo "Hi, $NAME"  #takes name as an input and save it in variable name
```

### 6. Command-line arguments

```bash
#!/bin/bash
echo "Script name: $0"
echo "First arg:   $1"
echo "Second arg:  $2"
echo "Arg count:   $#"
echo "All args:    $@"
echo "Exit status of last command: $?"
```

---

## Task 2: Operators and Conditionals

### 1. String comparisons

```bash
[ "$a" = "$b" ]     # equal
[ "$a" != "$b" ]    # not equal
[ -z "$a" ]         # true if $a is empty
[ -n "$a" ]         # true if $a is NOT empty
```

### 2. Integer comparisons

```bash
[ "$a" -eq "$b" ]   # equal
[ "$a" -ne "$b" ]   # not equal
[ "$a" -lt "$b" ]   # less than
[ "$a" -gt "$b" ]   # greater than
[ "$a" -le "$b" ]   # less than or equal
[ "$a" -ge "$b" ]   # greater than or equal
```

### 3. File test operators

```bash
[ -f "$file" ]   # is a regular file
[ -d "$dir" ]    # is a directory
[ -e "$path" ]   # exists (file or directory)
[ -r "$file" ]   # is readable
[ -w "$file" ]   # is writable
[ -x "$file" ]   # is executable
[ -s "$file" ]   # exists and is NOT empty (size > 0)
```

### 4. if / elif / else

```bash
if [ "$age" -ge 18 ]; then
    echo "Adult"
elif [ "$age" -ge 13 ]; then
    echo "Teenager"
else
    echo "Child"
fi
```

### 5. Logical operators

```bash
&& (AND) — runs the next command only if the previous one succeeded
mkdir backup && cp file.txt backup/
# copies file.txt only if mkdir succeeded
```

```bash
|| (OR) — runs the next command only if the previous one failed
cp file.txt backup/ || echo "Copy failed!"
# prints the message only if cp failed
```

```bash
! (NOT) — negates a condition or exit code true becomes false and vice versa.
if [ ! -f "file.txt" ]; then
    echo "File does not exist"
fi
```

### 6. Case statements

```bash
read -p "Choose from a,b,c : " num

case $num in
	a)
		echo "You chose a"
		;;
	b)
		echo "You chose b"
		;;
	c)
		echo "you chose c"
		;;
	*)
		echo "Invalid option"
		;;
esac

OutPut:
Choose from a,b,c : a
You chose a

Choose from a,b,c : d
Invalid option

```

---

## Task 3: Loops

### 1. for loop — list-based and C-style

```bash
# List-based
for name in Habeeb Mujtaba Wasif; do
    echo "Hello, $name"
done

# C-style
for ((i = 0; i < 5; i++)); do
    echo "i = $i"
done
```

### 2. while loop

```bash
count=1
while [ "$count" -le 5 ]; do
    echo "Count: $count"
    ((count++))
done
```

### 3. until loop

Runs until the condition becomes **true** (opposite of `while`).

```bash
count=1
until [ "$count" -gt 5 ]; do
    echo "Count: $count"
    ((count++))
done
```

### 4. Loop control — break, continue

```bash
for i in {1..10}; do
    if [ $((i % 3)) -eq 0 ]; then
        continue     # skip multiples of 3
    fi
    if [ "$i" -eq 8 ]; then
        break        # stop the loop here
    fi
    echo "$i"
done

Output:

1
2
4
5
7
#continue just skips if multiple of 3 and moves on.
#break shuts the whole loop down the moment it's triggered.
```

### 5. Looping over files

```bash
for file in *.log; do
    echo "Processing $file"
done
```

### 6. Looping over command output

```bash
# Looping over a command's output
echo -e "apple\nbanana\ncherry" | while read -r fruit; do
    echo "I found: $fruit"
done
Output:
I found: apple
I found: banana
I found: cherry
```

---

## Task 4: Functions

```bash
### 1. Defining a function

greet() {
    echo "Hello!"
}

### 2. Calling a function

greet          # just call it by name

### 3. Passing arguments

greet() {
    echo "Hello, $1! You are $2 years old."
}
greet "Habeeb" 30

### 4. Return values — return vs echo

return — just says "yes" or "no" (success/failure)
say_hi() {
    echo "Hi!"
    return 0
}

say_hi
echo "Exit code: $?"

O/p:
Hi!
Exit code: 0 #this means it succeeded

echo - itis used when you actually want a value back
bash
add() {
    echo $(($1 + $2))
}

result=$(add 5 3)
echo "The sum is: $result"

O/p:
The sum is: 8
```

### 5. Local variables

```bash
name="Outside"

show_name() {
    local name="Inside"
    echo "$name"
}

show_name
echo "$name"

O/p:
Inside
Outside

else without local the function changes the same name variable that existed outside — so it stays changed even after the function ends.
```

---

## Task 5: Text Processing Commands

### 1. grep - search patterns

```bash
grep "error" file.log        # basic search
grep -i "error" file.log     # case-insensitive
grep -r "TODO" ./src         # recursive search in directory
grep -c "error" file.log     # count matching lines
grep -n "error" file.log     # show line numbers
grep -v "debug" file.log     # invert match (lines NOT containing pattern)
grep -E "err(or)?s?" file.log  # extended regex (supports +, ?, |, etc.)
```

### 2. awk - column/pattern processing

```bash
awk '{print $1}' file.txt              # print first column
awk -F',' '{print $2}' file.csv        # use ',' as field separator
awk '$3 > 100 {print $0}' data.txt     # print lines where field 3 > 100
awk 'BEGIN {print "Start"} {print} END {print "Done"}' file.txt
awk '{sum += $2} END {print sum}' data.txt   # sum a column
```

### 3. sed - stream editor

```bash
sed 's/habeeb/wasif/' file.txt        # replace first "habeeb" per line with "wasif"
sed 's/habeeb/wasif/g' file.txt       # It only prints the output 
sed '2d' file.txt                # deletes line 2
sed -i 's/habeeb/wasif/g' file.txt    # edit the file in place
```

### 4. cut - extract columns

```bash
cut -d':' -f1,3 /etc/passwd   # extract fields 1 and 3
cut -c1-5 file.txt            # extract characters 1-5 of each line
```

### 5. sort

```bash
sort file.txt              # alphabetical sort
sort -n file.txt           # numerical sort
sort -r file.txt           # reverse order
sort -u file.txt           # sort and remove duplicates
sort -k2 file.txt          # sort by 2nd column/field
```

### 6. uniq

```bash
uniq file.txt              # remove adjacent duplicate lines (sort first!)
uniq -c file.txt           # count occurrences of each line
```

### 7. tr - translate/delete characters

```bash
echo "hello" | tr 'a-z' 'A-Z'     # HELLO — translate to uppercase
tr -d '\n' < file.txt             # delete newlines
```

### 8. wc — count lines/words/chars

```bash
wc -l file.txt      # count lines
wc -w file.txt       # count words
wc -c file.txt       # count bytes/characters
cat file.txt | wc -l # count lines from piped input
```

### 9. head / tail

```bash
head -n 10 file.txt       # first 10 lines
tail -n 10 file.txt       # last 10 lines
```

---

## Task 6: Useful Patterns and One-Liners

```bash
Find and delete files older than N days : `find . -mtime +4`
Count lines in all .log files : `wc -l file.log`
Replace a string across multiple files : `sed 's/hello/bye/g' *.txt`
Check if a service is running : `systemctl status ssh`
Monitor disk usage with alerts : `df -h | awk '$5>80'`
Tail a log and filter for errors in real time : `tail -f file.log | grep -i "error"`
```

---

## Task 7: Error Handling and Debugging

### 1. Exit codes

```bash
echo $?         # 0 = success, non-zero = failure
exit 0          # exit script successfully
exit 1          # exit script with an error
```

set -e — exit on error
set -u — treat unset variables as error
set -o pipefail — catch errors in pipes
set -x — debug mode (trace execution)
```bash
#!/bin/bash
set -x

a=5
b=3
sum=$((a + b))
echo "Sum is $sum"

set +x

O/P:
+ a=5
+ b=3
+ sum=8
+ echo 'Sum is 8'
Sum is 8

set -x turns on trace mode — before running each command, Bash prints it (prefixed with +) so you can see exactly what's executing and what values variables expanded to.
sum=$((a + b)) shows up as + sum=8 — you can see it already calculated 5 + 3 = 8 before assigning.
echo "Sum is $sum" shows up as + echo 'Sum is 8' — you can see $sum was expanded to 8 before the command ran.
set +x turns tracing back off, so anything after it runs normally without the extra + lines.
```

### 6. `trap` — run code on exit/signal

Runs a command or function when the script exits (or receives a signal), useful for cleanup.

```bash
#!/bin/bash
cleanup() {
    echo "Cleaning up temp files..."
    rm -f /tmp/myscript_*
}
trap cleanup EXIT
trap 'echo "Interrupted!"; exit 1' INT

echo "Working..."
sleep 10
echo "Done."

O/P: If you let it finish normally
Working...
Done.
Cleaning up temp files...

O/P: If you press Ctrl+C partway through
Working...
Interrupted!
Cleaning up temp files...
```

**Common combo for robust scripts:**

```bash
#!/bin/bash
set -euo pipefail
trap 'echo "Error on line $LINENO"' ERR

#lineno = is a built-in variable that always holds the current line number being executed.
So this trap means: "if any command fails, tell me exactly which line it happened on."
```

---
