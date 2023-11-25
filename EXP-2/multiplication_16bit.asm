; multi-segment executable file template.

data segment
    ; add your data here!
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here  
    mov ax, 1234h
    mov bx, 2314h
    mul bx
    
  
ends

end start ; set entry point and stop the assembler.
