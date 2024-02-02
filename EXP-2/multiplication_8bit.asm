include "emu8086.inc"

code segment
start:                   

    mov bl,10
    mov al,02
    mul bl          
    
    call print_num 
    define_print_num
    define_print_num_uns
  
ends

end start
