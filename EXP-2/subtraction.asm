include "emu8086.inc"

data segment

ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov es, ax

            
    mov ax,5000
    mov bx,4950
    
    sub ax,bx
    
    call print_num
    
    define_print_num
    define_print_num_uns
    
    mov ax, 4c00h
    int 21h    
ends

end start 
