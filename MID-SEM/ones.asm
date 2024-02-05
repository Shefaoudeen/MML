;write an ALP using 8086 instruction mnemonics to
;read an array of 16 bit element and count the number of 1's
;of every element and display them one after another

data segment
  array dw 0505h,0ABCDh,0FFFFh
  len dw 3 
  space db " $"
  count db 0
  ones dw 0
ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    lea si, [array]
    mov cx,[len] 

    looping:
      mov al,[si]
      mov ah,[si+1]
      call counting
      inc si
      inc si  
      lea dx,[space]
      mov ah,9
      int 21h
    loop looping
    hlt
    
    counting proc
      mov [count],00
      mov [ones],00
      mov BX,2
      mov dx,00
      stacking:
        cmp ax,0
        je onesCount
        
        mov bx,2
        div bx
        push dx  
        inc count        
        xor dx,dx
        jmp stacking

    onesCount:
      pop dx
      cmp dx,1
      jne next
      inc ones
      next:
      dec count
      cmp count,00
      je exit
      jmp onescount
    
    exit:
      mov dx,[ones]
      cmp dx,9
      jle digit
      cmp dx,16
      jge bigger
      add dx,7h
      digit:
      add dx,30h
      mov ah,2
      int 21h 
      ret
      bigger:
        mov bl,10h
        mov ax,[ones]
        mov count,0 
        hex:
        div bl
        mov dl,ah
        push dx
        inc count
        mov ah,00
        cmp ax,00
        jg hex 
        printingNum:
            pop dx  
            cmp dx,9
            jle digitprint
            add dx,7h
            digitprint:
            add dx,30h
            dec count
            mov ah,2   
            int 21h
            cmp count,00
        jne printingNum
        ret    
            
  end start
ends