; multi-segment executable file template.
data segment
 ; add your data here!
 array DB 01h,00h,0Eh,11h,08h 
 found db 'Minimum term at the BL register$'

ends

code segment
 assume cs:code, ds:data
start:
; set segment registers:
 mov ax, data
 mov ds, ax
 mov es, ax
 ; add your code here
 
 mov cx, 05h
 mov bl, 79h
 lea SI, array
up:
 mov al, [SI]
 cmp al, bl
 jge nxt
 mov bl, al
nxt:
 inc si

loop up

mov dx,offset found
mov ah,09h
int 21h 
 

 mov ax, 4c00h ; exit to operating system.
 int 21h 
ends
end start ; set entry point and stop the assembler.