# 🐚 Shell Scripting – Complete Detailed Notes

---

# 1️⃣ Script Structure

Every shell script starts with a **shebang line**:

```bash
#!/bin/bash
```

This tells the system to execute the script using the Bash shell.

### Basic Script Structure

```bash
#!/bin/bash

# Variable declaration
name="Edukron"

# Print statement
echo "Company Name: $name"
```

To execute:

```bash
chmod +x script.sh
./script.sh
```

---

# 2️⃣ Variables

## 🔹 Creating Variables

```bash
name="Edukron"
echo $name
```

Output:
```
Edukron
```

## 🔹 Accessing Variables

- `$name` → Access value
- `"${name}"` → Recommended format

---

## 🔹 Naming Conventions

Allowed:
- a-z
- A-Z
- _
- Case Sensitive → `Name` ≠ `name`

Rules:
- ❌ Cannot start with number → `1name`
- ❌ No spaces → `first name`
- ❌ No special characters except `_`
- ❌ No hyphen → `project-name`
- ❌ Cannot use Linux keywords → `if`, `then`, `fi`

---

## 🔹 Readonly Variables

```bash
readonly company="IBM"
echo $company
company="Infosys"
```

Output:
```
bash: company: readonly variable
```

---

## 🔹 Environment Variables

```bash
export project="AzureMigration"
echo $project
```

Common Environment Variables:

```bash
echo $USER
echo $PATH
echo $PWD
echo $HOME
```

---

# 3️⃣ User Input

```bash
echo "Enter your name:"
read name
echo "Hello $name"
```

Multiple input:

```bash
echo "Enter first and last name:"
read fname lname
echo "First: $fname"
echo "Last: $lname"
```

---

# 4️⃣ Arithmetic Operators

Arithmetic operations use `$(( ))`

---

## ➤ Addition

```bash
a=10
b=5
echo $((a+b))
```

Output: 15

---

## ➤ Subtraction

```bash
echo $((a-b))
```

Output: 5

---

## ➤ Multiplication

```bash
echo $((a*b))
```

Output: 50

---

## ➤ Modulus (Remainder)

```bash
num=7
echo $((num%2))
```

Output: 1 (Odd number)

---

# 5️⃣ Increment & Decrement Operators

---

## 🔹 Post Increment (i++)

Use value first, then increase.

```bash
#!/bin/bash
i=5
echo "Before post-increment: $i"
echo "Using i++: $((i++))"
echo "After post-increment: $i"
```

Output:
```
5
5
6
```

---

## 🔹 Pre Increment (++i)

Increase first, then use.

```bash
i=5
echo "Using ++i: $((++i))"
```

Output:
```
6
```

---

## 🔹 Post Decrement (i--)

```bash
i=5
echo $((i--))
```

---

## 🔹 Pre Decrement (--i)

```bash
i=5
echo $((--i))
```

---

# 6️⃣ Comparison Operators

| Operator | Meaning |
|----------|---------|
| -eq | Equal |
| -ne | Not equal |
| -gt | Greater than |
| -lt | Less than |
| -ge | Greater than or equal |
| -le | Less than or equal |

Example:

```bash
a=10
b=20

[ $a -eq $b ] && echo "Equal" || echo "Not Equal"
```

---

# 7️⃣ If-Else Conditions

## 🔹 Syntax

```bash
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
```

---

## Example

```bash
num=15
if [ $num -gt 20 ]; then
    echo "$num is greater than 20"
else
    echo "$num is less than or equal to 20"
fi
```

---

## Even or Odd

```bash
num=7
if [ $((num%2)) -eq 0 ]; then
    echo "Even"
else
    echo "Odd"
fi
```

---

## Grade System

```bash
marks=75
if [ $marks -ge 90 ]; then
    echo "Grade A"
elif [ $marks -ge 70 ]; then
    echo "Grade B"
else
    echo "Grade C"
fi
```

---

# 8️⃣ DevOps Real-Time Condition Examples

---

## 🔹 Check Docker Installed

```bash
if command -v docker &> /dev/null; then
    echo "Docker is installed"
else
    echo "Docker not installed"
fi
```

---

## 🔹 Check Disk Usage

```bash
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $usage -gt 85 ]; then
    echo "Disk usage critical"
else
    echo "Disk usage normal"
fi
```

Explanation:
- `df /` → Disk free
- `awk` → Get 2nd row, 5th column
- `sed` → Remove %
- Stored in `usage`

---

## 🔹 Check Memory

```bash
free_mem=$(free | awk '/Mem/ {print $4}')

if [ $free_mem -lt 500000 ]; then
    echo "Low memory"
else
    echo "Memory sufficient"
fi
```

---

# 9️⃣ For Loop

---

## 🔹 Basic For Loop

```bash
for i in {1..10}
do
    echo $i
done
```

---

## 🔹 C Style Loop

```bash
for ((i=2;i<10;i+=2))
do
    echo $i
done
```

Structure:
- Initialization
- Condition
- Increment

---

# 🔟 DevOps For Loop Examples

---

## 🔹 Check Multiple Servers

```bash
for server in google.com github.com yahoo.com
do
    ping -c 1 $server > /dev/null
    if [ $? -eq 0 ]; then
        echo "$server reachable"
    else
        echo "$server not reachable"
    fi
done
```

---

## 🔹 Create Multiple Users

```bash
for user in dev1 dev2 dev3
do
    useradd $user
    echo "User $user created"
done
```

---

# 1️⃣1️⃣ Functions

Functions help reuse code.

## 🔹 Syntax

```bash
function greet() {
    echo "Hello $1"
}
```

## 🔹 Calling Function

```bash
greet Bharath
```

---

## 🔹 Function with Return

```bash
add() {
    result=$(( $1 + $2 ))
    echo $result
}

add 10 5
```

---

# 1️⃣2️⃣ Basic Linux Commands

---

## 📂 Directory Commands

### ls – List files
```bash
ls
```

### pwd – Present working directory
```bash
pwd
```

### cd – Change directory
```bash
cd /home
```

---

## 📁 Directory Management

### mkdir
```bash
mkdir test
```

### rmdir
```bash
rmdir test
```

---

## 📄 File Operations

### cp
```bash
cp file1 file2
```

### mv
```bash
mv file1 newfile
```

### rm
```bash
rm file1
```

---

## 📖 File Viewing

### cat
```bash
cat file.txt
```

### less
```bash
less file.txt
```

### more
```bash
more file.txt
```

### head
```bash
head file.txt
```

### tail
```bash
tail file.txt
```

---

## 🔎 Searching

### grep
```bash
grep "error" file.txt
```

### find
```bash
find / -name file.txt
```

---

## 🔐 Permissions

### chmod
```bash
chmod 755 script.sh
```

### chown
```bash
chown user:group file.txt
```

---

## 💾 Disk Usage

### df
```bash
df -h
```

### du
```bash
du -sh folder
```

---

## ⚙️ Process Management

### ps
```bash
ps aux
```

### top
```bash
top
```

### kill
```bash
kill -9 PID
```

---

# 🎯 Conclusion

This covers:

- Script Structure
- Variables & Readonly
- User Input
- Arithmetic Operators
- Increment / Decrement
- Comparison Operators
- If-Else Conditions
- For Loops
- Functions
- Basic Linux Commands
- DevOps Real-Time Examples

---
