include 'emu8086.inc'

data segment
    term1 db 0
    term2 db 1
    nextterm db 1
    space db " $"    
ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    call scan_num
    sub cx,02
    
    mov dl,term1
    add dl,30h
    mov ah,02
    int 21h    
    
    lea dx,space
    mov ah,09
    int 21h
    
    mov dl,term2
    add dl,30h
    mov ah,02
    int 21h 
    
    lea dx,space
    mov ah,09
    int 21h
    
    series:
        mov ah,00
        mov dl,term1
        mov dh,term2
        mov term1,dh
        add dh,dl
        mov al,dh
        mov term2,al  
        call print_num
        lea dx,space
        mov ah,09
        int 21h
    loop series     
                
    
    define_scan_num
    define_print_num
    define_print_num_uns
ends
end start