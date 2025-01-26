# Hello World in MIPSLE Assembly (Linux)

A simple Hello World implementation in MIPSLE (MIPS little-endian) assembly language for Linux systems. MIPSLE represents the little-endian variant of the 32-bit MIPS architecture, which has found extensive use in embedded systems and networking equipment, particularly in devices where compatibility with x86 systems is important.

## Installation

On a MIPSLE Linux system, you'll need the standard GNU toolchain:

```bash
sudo apt-get update
sudo apt-get install binutils gcc
```

## Running

Assemble and link with little-endian flags:
```bash
as -o main.o main.s -EL
ld -o hello main.o -EL
./hello
```

## Code Explanation

The MIPSLE implementation combines characteristics of both 32-bit MIPS and little-endian architectures. While the assembly code looks identical to the standard MIPS version, the underlying binary format and memory layout differ significantly due to the little-endian byte ordering.

When working with MIPSLE, several aspects of the architecture become important to understand:

Memory Layout and Endianness:
A 32-bit value like 0x12345678 would be stored in memory as:
- Big-endian MIPS: 12 34 56 78
- Little-endian MIPSLE: 78 56 34 12

The endianness affects how multi-byte values are stored, but doesn't change:
- Individual byte operations (like our ASCII string)
- Program logic or structure
- System call numbers or conventions

Register Conventions:
- $v0: System call number
- $a0-$a2: Function arguments and system call parameters
- All registers are 32 bits wide

System Calls:
- write (4004): Outputs message to stdout
- exit (4001): Terminates the program

Build Process Differences:
- The -EL flag tells the assembler and linker to generate little-endian code
- Data alignment remains the same as big-endian MIPS (.align 2 for 32-bit boundaries)
- The toolchain handles all necessary byte swapping for instruction encoding

Just as with MIPS64LE, the code structure remains identical to its big-endian counterpart because the assembler and CPU handle the endianness transitions automatically. However, when debugging or working with binary data, understanding the little-endian nature of the system becomes crucial.
