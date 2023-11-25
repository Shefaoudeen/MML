include "emu8086.inc"
ORG 100h
MOV AX, 100
MOV BX, 100
ADD AX, BX
;now I will print the result which is in AX register
CALL PRINT_NUM
ret
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end
