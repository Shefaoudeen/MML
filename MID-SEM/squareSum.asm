include "emu8086.inc"
 
data segment
    array db 1,2,3,4,5,6
    SumMsg db "Sum of the Square of the number in array : $"
    length equ 6  
    sum db 0
ends

code segment
start:
    mov ax,data
    mov ds, ax
    mov es, ax
   
    mov dx,00h
    
    mov cx, length
    lea si, [array]

    looping:
        mov ah, 00h
        mov al, [si]
        mul al
        mov dl, sum
        add dl,al
        xchg dl,[sum]
        inc si    
    loop looping 
    
    lea dx, [SumMsg]
    mov ah, 9
    int 21h

    mov ah, 00h
    mov al, [sum]
    CALL PRINT_NUM 
    hlt
                
        
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS  

    final: 
        ends
end start   

