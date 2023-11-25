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

    mov ax, 50h
    mov bl, 05h
    div bl 
    
    ;dividing a 8-bit numbers, will produce quotent in AL and remainder in AH
    
ends

end start ; set entry point and stop the assembler.
