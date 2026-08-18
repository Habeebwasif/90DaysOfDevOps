# Read and Write Text Files (Practice)
* `touch notes.txt`
  - Creates a text file called notes.txt.
* `echo "echo "Hi, My Name is Habeeb!" > notes.txt`
  - Writes into notes.txt.
* `echo "I'm a recent CS Graduate." >> notes.txt`
  - Appends a line in notes.txt.
* `echo "My Goal is to build my career in DevOps." >> notes.txt`
  - Appends one more line in notes.txt.
* `cat notes.txt`
  - Reads notes.txt.
* `head -n 2 notes.txt`
  - Displays First two lines.
* ` tail -n 2 notes.txt`
  - Displays Last two lines.
* ` echo "Currently on Day 06 of learning Linux!" | tee -a notes.txt`
  - Shows output on the screen as well as append using `-a` in notes.txt
* `cat notes.txt`
  - Hi, My Name is Habeeb!
  - I'm a recent CS Graduate.
  - My Goal is to build my career in DevOps.
  - Currently on Day 06 of learning Linux!

