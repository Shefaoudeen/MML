include "emu8086.inc"

data segment
   d1 dw 8  
   odd db " - The given number is an odd number $"
   even db " - The given number is an even number $"
ends

stack segment
    dw 128 dup(0)
ends


code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax     
    
    mov ax,d1
    
    mov cx,0
    mov dx,0
    
    label1:    
        ;compare ax if 0
        cmp ax,0
        je print1
        
        mov bx,2
        div bx
        push dx  
        inc cx
        
        xor dx,dx
        jmp label1
    

    print1:
        cmp cx,0
        je exit  
        popping:
            pop dx
            mov ax,dx 
            call PRINT_NUM
            sar dx,1
            loop popping
            
        jc oddNumber
        jmp evenNumber
        
    oddNumber:
        lea dx, odd
        mov ah, 9
        int 21h
        jmp exit 
        
    evenNumber:
        lea dx, even
        mov ah, 9
        int 21h             
        jmp exit
        
    exit:
         mov ah,4ch
         int 21h   
                  
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS              
    
ends       
end start
