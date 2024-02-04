include "emu8086.inc"
 
data segment
    array db 1,2,3,4,5
    SumMsg db "Sum of the array : $"
    AvgMsg db "Average of the array : $" 
    length equ 5     
    new db 0AH,0DH,"$" 
    sum db 0
    avg db 0
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
    
    call printNewLine  
    
    lea dx, [AvgMsg]
    mov ah, 9
    int 21h

    mov ah, 00h
    mov al, [sum]
    mov bl, length
    div bl
    mov ah,00h
    CALL PRINT_NUM
    hlt
         
    printNewLine PROC 
        lea dx, [new]
        mov ah, 09h
        int 21h 
        RET
                
        
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS  

    final: 
        ends
end start   

