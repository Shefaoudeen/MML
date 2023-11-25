; multi-segment executable file template.

DATA segment
    ; add your data here!
    ARRAY DB 1,2,3,4,5,6
    AVG DB ?
    MSG DB "AVERAGE = $"
ends


CODE SEGMENT 
    ASSUME DS:DATA CS:CODE    
ends

start:
; set segment registers:
    mov ax, DATA
    mov ds, ax
    mov es, ax

    ; add your code here
            
   LEA SI, ARRAY
   LEA DX, MSG
   MOV AH,9
   INT 21H
   
   MOV AX,00
   MOV BL,6
   MOV CX,6
   
   ADDING:
    ADD AL,ARRAY[SI]
    INC SI

    LOOP ADDING
    
    DIV BL
    
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H     
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
