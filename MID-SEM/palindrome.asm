data segment
  mystr dw "ECE$"
  str1 db "Palindrome$"
  str2 db "Not a palindrome$"
  length dw 3
  empty dw "$"
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  lea si, [mystr]
  lea di, [empty]

  mov cx,[length]

  pushing:
    mov ax,[si]
    mov dx,ax
    push dx
    inc si
  loop pushing
  
  mov cx,[length]
  lea si,[empty]

  popping:
    pop dx
    xchg dx,[si]
    inc si
  loop popping

  lea si,[mystr]
  lea di,[empty]
  cmpsb 
  je palindrome
  jmp Notpalindrome
  
  palindrome:
    lea dx,[str1]
    mov ah,09
    int 21h
    jmp final
    
  Notpalindrome:
    lea dx,[str2]
    mov ah,09
    int 21h
    jmp final  
  
  final:
    mov ax,4c00h
    int 21h
ends
end start