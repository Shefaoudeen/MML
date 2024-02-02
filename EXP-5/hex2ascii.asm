data segment
  hex db 9Ah
  ascii dw ?
ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov ah,00h
    mov ah,al
    and ah, 0f0h
    MOV cl,04h
    ror ah,cl
    add ah,30h
    cmp ah,39h
    jle s
    