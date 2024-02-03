;Write ALP using 8086 mnemonics compare two strings
; if they are equal print the length alone.

data segment
  str1 db "shefa$"
  str2 db "shefa$"
  len dw 0
  msg1 db "Both string are same$" 
  msg2 db "Both string are not same$"
  lenMsg db "Length = $"
  new db 0ah,0dh,"$"
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  lea si, [str1]
  
  findLength:
        mov ah,[si]
        cmp ah,"$"
        je next
        inc len
        inc si
    jmp findLength 
  
  next:  
  lea si, [str1]
  lea di, [str2]     
  mov cx,len
  
  
  rep cmpsb
  je stringSame
  jmp stringNotSame

  stringSame:
    lea dx,[msg1]
    mov ah,09
    int 21h
    lea dx,[new]
    mov ah, 09
    int 21h
    lea dx,[lenMsg]
    mov ah,09
    int 21h
    
    print:
    mov dx,len
    add dx,30h     
    mov ah,02
    int 21h
    hlt

  stringNotSame:
    lea dx,[msg2]
    mov ah,09
    int 21h
    hlt

ends
end start