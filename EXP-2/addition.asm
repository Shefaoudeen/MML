include "emu8086.inc"

data segment
    ; add your data here!
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov ax,4H
    mov bx,8H
    add ax,bx
         
    call print_num
    
    define_print_num
    define_print_num_uns                   
    
    mov ax, 4c00h 
    int 21h    
ends

end start 
