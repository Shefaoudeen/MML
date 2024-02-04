;Write a 8086 program to convert a number from
; celsius degree to Fahrenheit degree.
; Both the inputs and outpost should be in decimal.

include 'emu8086.inc'

data segment
  cel dw 100
  term1 db ?
  term2 db 32
  result db ?
  celMsg db "Temperature in Celsius : $"
  fahMsg db "Temperature in Fahrenheit : $"
  newline db 0ah,0dh,"$"
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax

  ;computing first term
  mov ax,[cel]
  mov bl,9
  mul bl
  mov bx,5
  div bx
  mov [term1],al
  
  ;computing result
  mov al,[term1]
  mov bl,[term2]
  add al,bl
  mov [result],al

  ;printing the answer
  lea dx,[celMsg]
  mov ah,09
  int 21h
  mov ax,[cel]
  call print_num 

  lea dx,[newline]
  mov ah,09
  int 21h

  lea dx,[fahMsg]
  mov ah,09
  int 21h
  mov ah,00
  mov al,[result]
  call print_num 

  define_print_num
  define_print_num_uns
ends
end start