data segment
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  mov bx, 0000h
  mov dh, 00h
  
  mov ax, 100h
  
  compare1:
    cmp ax, 10000
    jl compare2
    sub ax,10000
    add dh,1
    jmp compare1

  compare2:
    cmp ax, 1000
    jl compare3
    sub ax, 1000
    add bx, 1000h
    jmp compare2

  compare3:
    cmp ax, 100
    jl compare4
    sub ax, 100
    add bx, 100h
    jmp compare3
  
  compare4:
    cmp ax, 10
    jl final
    sub ax, 10
    add bx, 10h
    jmp compare4

  final:
    add bx,ax
    ends  
end start
