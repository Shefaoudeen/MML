data segment
 array DB 01h,20h,0Eh,11h,08h 
 found db 'Minimum term = $'
ends

code segment

start:

 mov ax, data
 mov ds, ax
 mov es, ax

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

    add bl,30h
     
    mov dl,bl
    mov ah,02
    int 21h
    
 mov ax, 4c00h
 int 21h 
ends
end start