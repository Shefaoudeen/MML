data segment
  string db "Hello World$"
  count dw 11
  search db "e$"
  
  str1 db "String Found$"
  str2 db "String not Found$"
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  mov cx, count
  mov di, offset string
  mov al, [search]
  repne scasb
  
  jz yes
  mov dx, offset str2
  mov ah,09h
  int 21h
  jmp final
  
  yes:
    mov dx, offset str1
    mov ah, 09h
    int 21h

  final:
    mov ah, 4ch
    int 21h

  ends
end start