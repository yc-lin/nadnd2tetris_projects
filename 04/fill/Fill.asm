// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here. 
  @SCREEN
  D=A
  @addr
  M=D

  @KBD
  D=A
  @kbd
  M=D

  @8191
  D=A

  @n
  M=D

  @i
  M=0

  @draw
  M=0

(MAIN)
  @i
  M=0

  @kbd
  A=M
  D=M

  @CHECK_DRAWB
  D;JEQ

  @CHECK_DRAWW
  0;JMP

(CHECK_DRAWB)
  @draw
  D=M

  @MAIN
  D;JGT
  @PAINTB
  0;JMP
  
(CHECK_DRAWW)
  @draw
  D=M

  @MAIN
  D;JLT

  @PAINTW
  0;JMP

(DRAWB_COMPLETE)  
  @draw
  M=1
  @MAIN
  0;JMP

(DRAWW_COMPLETE)  
  @draw
  M=-1
  @MAIN
  0;JMP

(PAINTB)
  @i
  D=M

  @n
  D=D-M

  @DRAWB_COMPLETE
  //@END
  D;JGT

  @addr
  D=M

  @i
  A=D+M
  M=-1

  @i
  M=M+1

  @PAINTB
  0;JMP

(PAINTW)
  @i
  D=M

  @n
  D=D-M

  @DRAWW_COMPLETE
  D;JGT

  @addr
  D=M

  @i
  A=D+M
  M=0

  @i
  M=M+1

  @PAINTW
  0;JMP

(END)
  @END
  0;JMP
