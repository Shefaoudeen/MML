;write a program to subtract two 32 bit numbers

data SEGMENT
    n1 DD 9ABCD980H   
    n2 DD 5841A748H
    ans DD ?
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
start:
    MOV AX,DATA
    MOV DS,AX
    MOV DL, 00H
    MOV AX, WORD PTR n1
    MOV BX, WORD PTR n2 
    SUB AX,BX
    
    MOV WORD PTR ans,AX
    MOV AX,WORD PTR n1+2
    MOV BX,WORD PTR n2+2
    SBB AX,BX
    
    MOV WORD PTR ans+2,AX
    JNC XX
    INC DL
    XX: MOV BYTE PTR ans+4,DL   
    MOV AX, 4C00H
    INT 21H
    CODE ENDS
END START
     
        
    