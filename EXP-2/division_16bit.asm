include "emu8086.inc"

code segment
start:
    mov ax, 4500
    mov bx, 150
    
    div bx
    call print_num
    
    define_print_num
    define_print_num_uns
    
       
ends
end start