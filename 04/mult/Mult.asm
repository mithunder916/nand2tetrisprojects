// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// essentially adds R0 to itself n times, n being equal to R1

@R1
D=M
@n
M=D // n=R1
@i
M=1 // i=1
@product
M=0 // product=0

(LOOP)
@i
D=M
@n
D=D-M // calculates i - R1, to compare iterations with value of second multiple
@STOP
D;JGT

@product
D=M
@R0
D=D+M
@product
M=D // product = product + R0

@i
M=M+1 // i++
@LOOP
0;JMP

(STOP)
@product
D=M
@R2
M=D // RAM[2]=product
