; Write an ALP using 8086 mnemonics to the compute the sum 
;of all numbers of an array that are divisible by 7. 
;Also use DOS interrupts to display the sum and count of such numbers.

data segment
  array db 1,14,3,21,5,77,7,8
  length equ ($-array)
  count dw 0
  sum db 0
  sumMsq db "Sum = $"
  countMsg db "Count = $"
  new db 0ah,0dh,"$"
ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,length
    lea si, [array]
    mov bl,07h

    looping:  
      mov ah,00h    
      mov al,[si]
      div bl
      cmp ah,00
      je summing
      jmp next
    summing: 
      mov al,sum    
      add al,[si]
      mov sum,al
      inc count
    next:
      inc si
    loop looping

    mov bl,10
    mov al,sum 
    mov dx,00
    mov cx,00

    stacking:
      mov ah,00
      div bl 
      mov dl,ah
      mov dh,00h 
      push dx
      inc cx
      cmp ax,00
      jg stacking
    
    lea dx, [sumMsq]
    mov ah,09
    int 21h
    
    printing:
      pop dx
      add dx,30h
      mov ah,2
      int 21h
    loop printing 
    
    lea dx,[new]
    mov ah,09
    int 21h 
    
    lea dx,[countMsg]
    mov ah,09
    int 21h         
    
    mov dx,count 
    add dx,30h
    mov ah,02
    int 21h
    
    hlt
  ends
end start