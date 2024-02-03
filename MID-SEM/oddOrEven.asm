;Write an ALP using 8086 mnemonics to find out 
;the odd and even numbers in an array and compute their sum


data segment
  array db 10,14,35,27,19,77,7,84
  length equ ($-array)
  even db 0
  odd db 0
  evenMsq db "Even = $"
  oddMsg db "Odd = $"
  new db 0ah,0dh,"$"
ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,length
    lea si, [array]
    mov bl,02h

    looping:  
      mov ah,00h    
      mov al,[si]
      div bl
      cmp ah,00
      je Evensumming
      jmp Oddsumming
    Evensumming: 
      mov al,even    
      add al,[si]
      mov even,al
      jmp next
    Oddsumming: 
      mov al,odd    
      add al,[si]
      mov odd,al
    next:
      inc si
    loop looping

    lea dx,[evenMsq]
    mov ah,09
    int 21h

    mov al,[even]
    mov ah,00h
    call printing

    lea dx,[new]
    mov ah,09
    int 21h

    lea dx,[oddMsg]
    mov ah,09
    int 21h 

    mov al,[odd]
    mov ah,00h
    call printing
    hlt


  printing proc
      mov bl,10
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
    print:
      pop dx
      add dx,30h
      mov ah,2
      int 21h
    loop print
    ret
    
  ends
end start