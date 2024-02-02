data segment
    hexa db 40h
    ascii dw ?
ends

code segment
    start:
       mov ax,data
       mov ds,ax
       mov es,ax
       
       mov ah,hexa
       and ah, 0f0h
       mov cl,04h
       ror ah,cl
       add ah,30h
       cmp ah,39h
       jle s
       and ah,07h
       
    s:
        mov bh,ah
        and al,0fh
        add al,30h
        cmp al,39h
        jle s1
        add al,07h
        
    s1:
        mov cl,al
        add bx,cx
        mov ascii,bx
        mov ax, 4c00h
        int 21h
ends
end start