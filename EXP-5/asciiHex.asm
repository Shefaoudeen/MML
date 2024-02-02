org 100h
.data
mystr DB 'A','B','C'
RES  DB 10 DUP ('$')  
.code

mov cx, 3
lea si,mystr
loop conversion:
mov AX,[si]                               
mov ah,0
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,RES
    MOV AH,9
    INT 21H
mov dl,' '
mov ah,2
int 21h 
loop conversion

HEX2DEC PROC NEAR
    MOV CX,0
    MOV BX,10
LOOP1: MOV DX,0
       DIV BX
       ADD DL,30H
       PUSH DX
       INC CX
       CMP AX,9
       JG LOOP1
       ADD AL,30H
       MOV [SI],AL
LOOP2: POP AX
       INC SI
       MOV [SI],AL
       LOOP LOOP2
       RET
HEX2DEC ENDP           
END START 