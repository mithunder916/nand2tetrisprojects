// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(RESET)
@SCREEN
D=A
@R0
M=D // sets RAM0 to SCREEN address

(KEYPRESS)
@KBD
D=M
@FILLED
D;JGT // checks if scan-code is >0; jumps to FILLED if so
@EMPTY
D;JEQ // jumps to EMPTY if scan-code is 0
@KEYPRESS
0;JMP

(FILLED)
@R1
M=-1 //selects -1 as what to fill screen with
@CHANGE
0;JMP

(EMPTY)
@R1
M=0 //selects 0 to fill screen with
@CHANGE
0;JMP

(CHANGE)
@R1
D=M //checks contents of R1 (either -1 or 0);
@R0
A=M // gets screen address
M=D // fills screen address

@R0
D=M+1 //increments to next pixel
@KBD
D=A-D //

@R0
M=M+1
A=M

@CHANGE
D;JGT //

@RESET
0;JMP
