data segment
  array dw 10,34,33,75,100,99
  length equ 6
  digit db 0
  space db " $"
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  lea si,[array] ; array starting address load panra
  mov cx,length ; length cx la load panra looping ku
  
  looping:

    mov ax,[si] ; oru oru number ah ax ku load panra
    mov bl,03 ; divisble by 3 ah check panra
    div bl
    cmp ah,00  
    jne nextCheck ; ilana divisible by 10 ku pora
    call print ; ama na print panra
    jmp increment ; then increment panro
    
    nextCheck:
    mov ax,[si] ; divisible operation panra naale ax value change aagu so again reload panro
    mov bl,10 ; ipo divisible by 10 ah check panro
    div bl
    cmp ah,00
    jne increment ; ilana increment panro
    call print ; amana print panro
    
    increment: ; inga increment aagudhu
        inc si
        inc si
  loop looping 
  hlt
    
    print proc ; ithu thaniya oru function
      mov dx,00
      mov ax,[si] ; divisible operation panra naale ax value change aagu so again reload panro 
      mov bl,10h ; hex naale bl ku 10h load panro
      mov [digit],0 ; number of digit ku 0 va irukathu
      stacking:
        mov ah,00 ; 8 bit division panra naale ah la remainder varu so clear panra
        div bl
        mov dl,ah ; stack ku push panna dl ku load panra
        push dx ; stack ku load panra
        inc [digit] ; digit no inc panra
        cmp ax,00 ; above 0 na again dividing process nadhaku
        jg stacking
      printing:
        pop dx ; load panna stack la oru oru element ah pop panra
        add dx,30h ; 0-9 na +30h
        cmp dx,39h ; value 0-F range la varu
        jle next ; 9 or below na direct ah print aagu
        add dx,07h ; ilana +7 thara so A-F ascii print aagu
        next:
          mov ah,02h ; printing process inga nadhakudu
          int 21h
        dec [digit] ; digit ah dec panra
        cmp [digit],00 ; digit zero aagura varaiku print panra
      jg printing
      
      lea dx,[space] ; oru white space print panra
      mov ah,9
      int 21h
      ret ; enga call pannano angale poidu

end start
ends