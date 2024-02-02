include "emu8086.inc"

data segment
 array DB 01,09,59,11,29 
 found db 'Max term = $' 
 
ends

code segment
start:

 mov ax, data
 mov ds, ax
 mov es, ax
 
 mov cx, 05h    
 mov bl, 00h   
 lea SI, array

    up:
     mov al, [SI]
     cmp al, bl
     jl nxt      
     mov bl, al 
     
    nxt:
        inc si
 
 loop up ; 
 
    mov dx,offset found
    mov ah,09h
    int 21h 
                                
    mov al,bl
    mov ah,00
    call print_num 
    
    define_print_num
    define_print_num_uns
                                 
 mov ax, 4c00h 
 int 21h 
ends
end start ; set entry point and stop the assembler