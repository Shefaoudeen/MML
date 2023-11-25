
org 100h

; add your code here
MOV dx , OFFSET msg
MOV ah, 9
INT 21H

ret
                      
  msg DB "Hello World $"


