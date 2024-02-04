;Write a 8086 program to compute the expression of 
;A=X^3-3X/2 where A is a 16 bit number and X is a 8 bit number 
;and display the decimal equivalent with the Dos Interuppt

include 'emu8086.inc'

data segment
  x db 5
  term1 dw ?
  term2 dw ?
  result dw ?
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  ;computing first term
  mov ah,00h
  mov al,[x]
  mov bl,[x]
  mul bl
  mul bl
  mov [term1],ax

  ;computing second term
  mov bx,2
  mov ah,00h
  mov al,[x]
  div bx
  mov cx,3
  mul cx
  mov [term2],ax
  
  mov cx,00
  ;computing result
  mov ax,[term1]
  mov bx,[term2]
  sub ax,bx 
  mov bl,10
  stacking:
      div bl 
      mov dl,ah
      mov dh,00h 
      push dx
      inc cx
      mov ah,00
      cmp ax,00
      jg stacking
    printing:
      pop dx
      add dx,30h
      mov ah,2
      int 21h
    loop printing               
                  
  define_print_num
  define_print_num_uns                
ends
end start