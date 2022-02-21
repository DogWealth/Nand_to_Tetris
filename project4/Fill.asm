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
//screen(16384+0~8191)，keyboard（24576）
@SCREEN
D = A
@screen
M = D
@8192
D = A
@n//screen(16384+0~8191)
M = D

(LOOP)//不断循环来检测键盘按键
@i
M = 0
@24576//keyboard，没按下就跳转到white 否则顺序运行到black
D = M
@WHITE
D;JEQ

(BLACK)
@i
D = M
@n
D = D - M
@LOOP
D;JEQ

@screen//循环来改变颜色
D = M
@i
A = D + M
M = -1
@i
M = M + 1
@BLACK
0;JMP

(WHITE)
@i
D = M
@n
D = D - M
@LOOP
D;JEQ

@screen
D = M
@i
A = D + M
M = 0
@i
M = M + 1
@WHITE
0;JMP