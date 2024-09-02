// ARM 64 assembler with macOS system calls. This is not portable at all.

.global _start		// Provide program starting address to linker
.align 2	

_start:
    mov x0, #0      // Initialize the sum to 0
    mov x1, #10     // Initialize the counter to 10

loop:
    add x0, x0, x1  // Add the counter to the sum
    sub x1, x1, #1  // Decrement the counter

    cmp x1, #0     // Compare the counter with 0
    bne loop       // If the counter is not equal to 0, go back to the loop

exit:

//	mov     x0, #0		// Use 0 return code. By commenting this out, we use the result (which is in x0) as return code.
	mov     x16, #1		// System call number 1 terminates this program
	svc     #0x80		// Call kernel to terminate the program (SuperVisor Call)


// https://github.com/below/HelloSilicon#chapter-1
// > as -arch arm64 -o sum.o sum.s 
// > ld -o sum sum.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

// > sum
// > echo $?  // Prints the return code of the program (which should be 55)

// > lldb sum
// b exit    // sets a breakpoint at the exit label
// run       // run until execution hits the breakpoint
// (lldb) register read x0
//  ->    x0 = 0x0000000000000037 (in hex)