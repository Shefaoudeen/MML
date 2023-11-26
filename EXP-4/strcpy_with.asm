data segment
  msg1 db "String1 = $"
  msg2 db "String2 = $"
  str1 db "SHEFA$"
  str2 db "00000$" 
  new db 0AH,0DH,"$"

ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  mov bl, 00h
  lea si, [str1]
  lea di, [str2]
  
  lea dx, [msg1]
  mov ah, 09h
  int 21h
  lea dx, [str1]
  mov ah, 09h
  int 21h
  
  lea dx, [new]
  mov ah, 09h
  int 21h

  jmp print2

  copy:
    cld
    mov cx,5
    rep movsb
    mov bl, 01h
    jmp print2
  
  print2:
    lea dx, [msg2]
    mov ah, 09h
    int 21h
    lea dx, [str2]
    mov ah, 09h
    int 21h
    lea dx, [new]
    mov ah, 09h
    int 21h
    cmp bl,00h
    jz copy

  final:

  ends
end start