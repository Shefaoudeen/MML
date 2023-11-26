;multi-segment executable file template.
data segment
 ; add your data here! 
 array DB 01h,0Ah,19h,11h,29h
 res db ? 
 found db 'Max term is in the BL ..$' 
 
ends
stack segment
 dw 128 dup(0)
ends
code segment
assume cs:code, ds:data
start:
; set segment registers:
 mov ax, data
 mov ds, ax
 mov es, ax
; add your code here
 
 mov cx, 05h    ; Number of element in the array
 mov bl, 00h    ; arbitary maximum term
 lea SI, array
    up:
     mov al, [SI]
     cmp al, bl
     jl nxt       ; jump if less than
     mov bl, al 
     
    nxt:
        inc si
 
 loop up ; loop until cx not equal to zero
 
    mov dx,offset found
    mov ah,09h
    int 21h 
  
 mov ax, 4c00h ; exit to operating system.
 int 21h 
ends
end start ; set entry point and stop the assembler