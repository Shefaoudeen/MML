; multi-segment executable file template.

data segment
    ; add your data here!
   odd db "The given number is an odd number $"
   even db "The given number is an even number $"
ends


code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    
    mov ax, 0Ah
    mov bl, 02h
    div bl
    
    cmp ah, 00h
    jz evenNumber
    lea dx, odd
     mov ah, 9
     int 21h  
     jmp ending
    
    
    evenNumber:
     lea dx, even
     mov ah, 9
     int 21h       
    
    ending:
ends

end start ; set entry point and stop the assembler.
