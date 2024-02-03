data segment
  msg1 db "Healo World$"
  msg2 db "Hello World$"
  str1 db "Strings are equal$"
  str2 db "Strings are not equal$"
  count db 11
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  mov cl,count
  lea si, [msg1]
  lea di, [msg2]
  rep cmpsb

  jnz case1
  lea dx, str1
  jmp final

  case1:
    lea dx, str2

  final:
    mov ah,09h
    int 21h

  ends
end start
