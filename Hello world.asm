
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
MOV dx , OFFSET msg
MOV ah, 9
INT 21H

ret
                      
  msg DB "Hello World $"


