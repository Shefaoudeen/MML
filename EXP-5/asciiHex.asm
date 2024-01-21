data segment
  myStr db 'S','H','E','F','A'
  res db 10 dup ('$')
  looping dw 5
  index dw 0h
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  mov cx, [looping]

  conversion:
  xchg cx, [looping]
  mov si, index
  lea si,myStr[si] 
  mov ax, [si]
  mov ah,0
  lea si,res
  call ascii2hex
  lea dx, res
  mov ah,9
  int 21h
  call comma
  inc index
  mov cx,[looping]
  loop conversion
  jmp final

ascii2hex proc
  mov cx,0
  mov bx,10
  loop1:
    mov dx,0
    div bx
    add dl,30h
    push dx
    inc cx
    cmp ax,9H
    jg loop1
    add al,30h
    mov [si], al
  loop2:
    pop ax
    inc si
    mov [si],al
    loop loop2
  ret
ascii2hex endp  

comma proc 
mov dl, ' '
mov ah,2
int 21h
ret
comma endp

final:
ends
end start