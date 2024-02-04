;write an ALP using 8086 instruction mnemonics to
;read an array of 16 bit element and display them with 
;their bytes swapped if positive and odd. The number must be 
;displayed without swapping otherwise

data segment
  array dw 1243h,00ABCDh,7887h
  len dw 3 
  space db " $"
  count db 0
ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    lea si, [array]
    mov cx,[len] 

    looping:
      mov bl,2h
      mov ah,00
      mov al,[si]
      div bl 
      cmp ah,00
      je without
      jmp swapping
    swapping:
      mov ah,00
      mov al,[si]
      call printing
      mov ah,00
      mov al,[si+1]
      call printing
      jmp next
    without:
      mov ah,00
      mov al,[si+1]
      call printing
      mov ah,00
      mov al,[si]
      call printing
      jmp next
    next:
      inc si
      inc si  
      lea dx,[space]
      mov ah,9
      int 21h
    loop looping
    hlt
    
    printing proc
      mov [count],00
      mov bl,10h
      stacking:
        div bl
        mov dl,ah
        mov dh,00 
        push dx
        inc [count] 
        mov ah,00    
        cmp al,00
      jg stacking
      cmp count,1h
      jnz print
      mov dx,'0'
      mov ah,2
      int 21h 
    print:
      pop dx
      cmp dx,9
      jle digit
      add dx,7h
      digit:
      add dx,30h
      mov ah,2
      int 21h 
      dec count
      cmp [count],00
      je exit
      jmp print
    exit:
      ret
  end start
ends