data segment
  msg1 db "String1 = $"
  msg2 db "String2 = $"
  str1 db "MPMC$"
  str2 db "0000$" 
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
  call printString
  lea dx, [str1]
  call printString
  call newline

  call print2    

  copy:
    cld
    mov cx,4
    rep movsb
    mov bl, 01h
    call print2
    jmp final
  
  print2 PROC
    lea dx, [msg2]
    call printString
    lea dx, [str2]
    call printString
    call newline
    ret
       
  newline PROC
    lea dx, [new]
    call printString
    ret          
  
  printString PROC
    mov ah, 09h
    int 21h 
    ret
       
  final:

  ends
end start