DATA segment
    ARRAY DB 1,2,3,4,5,6
    MSG DB "AVERAGE = $"
ends


CODE SEGMENT 
start:
    mov ax, DATA
    mov ds, ax
    mov es, ax
            
   LEA SI, ARRAY
   
   LEA DX, MSG
   MOV AH,9
   INT 21H
   
   MOV AX,00
   MOV BL,6
   MOV CX,6
   
   ADDING:
    ADD AL,[SI]
    INC SI

    LOOP ADDING
    
    DIV BL
    
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H     
    
    mov ax, 4c00h
    int 21h    
ends

end start
