;Write ALP using 8086 mnemonics to determine 
;the numbers in an array between 100 to 1000 
;and print the output in another array.

 
include 'emu8086.inc' 
 
data segment
  array dw 150,300,450,99,1504,2000,800
  length equ ($-array)/2
  newArray dw 0
  newlen dw 0
  arrMsg db "New array = $"
  space dw " $"
ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,length
    lea si, [array]
    lea di, [newarray]

    looping:    
      mov ax,[si]
      cmp ax,100
      jl next
      cmp ax,1000
      jg next
        mov bx,newlen
        add bx,1
        mov newlen,bx
        mov dx,[si]
        push dx
    next:
      inc si 
      inc si
    loop looping
    
    lea si, [3000]       
    mov cx,newlen       
    popping:
        pop dx
        xchg dx,[si]
        inc si
        inc si
    loop popping    
    
    lea dx,[arrMsg]
    mov ah,09
    int 21h
    
    mov cx,newlen
    lea si,[3000] 
    
    ArrayPrinting:
      mov ax,[si]
      call print_num
      lea dx, [space]
      mov ah,09
      int 21h  
      inc si
      inc si    
      sub newlen,1
    loop ArrayPrinting
    hlt

  define_print_num 
  define_print_num_uns
    
  ends
end start