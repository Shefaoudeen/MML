;palindrome, storing data from one array into another array
;based on some condition, uppercase lowercase programs, 
;search for a number in a given array                  

include 'emu8086.inc'
data segment
    mystr db "SheFaoudeen123@#$%"
    len = $-mystr
    lower dw 0
    upper dw 0
    number dw 0
    spe dw 0 
    lowerStr db "Lowercase = $"
    upperStr db "Uppercase = $"
    numberMsg db "Number = $"
    SpecialMsg db "Special characters = $"
    newLine db 0ah,0dh,"$"
ends

code segment
    start:   
        mov ax,data
        mov ds,ax
        mov es,ax
        mov cx,len
        
        lea si, [mystr]
        
        looping:
            mov dx,[si]
            cmp dl,30h
            jl special
            cmp dl,39h
            jg next1
            inc number
            jmp next

            
            next1:
            cmp dl,41h
            jl special
            cmp dl,5Ah
            jg next2
            inc upper
            jmp next

            
            next2:
            cmp dl,61h
            jl special
            cmp dl,7Ah
            jg special
            inc lower
            jmp next

            
            special:
            inc spe

            next: 
            inc si
        loop looping
        
        ;printing upper case count
        lea dx,[upperStr]
        call printString
        mov ax,upper
        call print_num
        call printNewLine
         
        ;printing lower case count 
        lea dx,[lowerStr]
        call printString
        mov ax,lower
        call print_num
        call printNewLine
         
        ;printing number count 
        lea dx,[numberMsg]
        call printString
        mov ax,number
        call print_num
        call printNewLine  
         
        ;printing special character count 
        lea dx,[SpecialMsg]
        call printString
        mov ax,spe
        call print_num
        hlt
        
        
        printNewLine proc
            lea dx,[newLine]
            call printString
            ret
        
        printString proc
            mov ah,09
            int 21h
            ret  
        
        define_print_num
        define_print_num_uns
    end start
ends
