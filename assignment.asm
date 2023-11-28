include "emu8086.inc"
 
data segment
    array db 1h,2h,3h,4h,5h,10h
    oddSum db "Sum of odd number : $"
    evenSum db "Sum of even number : $"  
    oddAvg db "Average of odd number : $" 
    evenAvg db "Average of even number : $"
    count dw 6      
    new db 0AH,0DH,"$" 
    oddCount db 0h
    evenCount db 0h  
    even db 0h
    odd db 0h

ends

code segment
start:
    mov ax,data
    mov ds, ax
    mov es, ax
   
    mov bl, 02h
    mov dx,00h
    
    mov cx, 6
    lea si, [array]

    looping:
    mov ah, 00h
        mov al, array[si]
        div bl
        
        cmp ah, 00h
        jz evenSuming
        jmp oddSuming
    
        evenSuming:
            add dl, array[si] 
            inc evenCount
            jmp next 
            
        oddSuming:
            add dh, array[si]
            inc oddCount
            jmp next
            
       next:   
        inc si
         
    loop looping
    
    xchg dl,even
    xchg dh,odd

    
    lea dx, [evenSum]
    mov ah, 9
    int 21h

    mov ah, 00h
    mov al, [even]
    CALL PRINT_NUM 
    
    call printNewLine  
    
    lea dx, [evenAvg]
    mov ah, 9
    int 21h 
    mov ah, 00h
    mov al, even
    mov bl, evenCount
    div bl
    mov ah,00h
    CALL PRINT_NUM
        
    jmp printOdd:  
         
 printOdd:   
        call printNewLine   
        
        lea dx, [oddSum]
        mov ah, 9
        int 21h               
     
  
        mov ah, 00h
        mov al, [odd]
        CALL PRINT_NUM
        
        call printNewLine 
        
        lea dx, [oddAvg]
        mov ah, 9
        int 21h  
        
        mov ah, 00h
        mov al, odd 
        mov bl,oddCount
        div bl
        mov ah, 00h
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

