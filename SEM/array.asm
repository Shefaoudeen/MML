;Write ALP using 8086 mnemonics with an array of 16 bit integers and 
;display the avg of odd numbers and even numbers in descendingÂ order

include 'emu8086.inc'

data segment
  array dw 10,16,11,40,99,64,75,100
  len equ 8
  oddSum dw 0
  oddCount db 0 
  evenCount dw 0  
  testing dw ?
  new db 0ah,0dh,"$" 
  space db " $"
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  

  mov cx,len

  lea di,[5000]
  lea si,array
  looping:
    mov bl,02
    mov ax,[si]
    mov testing,ax
    div bl
    cmp ah,01
    je oddSumming
    call stackingEven
    jmp next

    oddSumming:
      mov dx,oddSum
      add dx,[si]
      mov oddsum,dx
      inc oddcount
      jmp next
    
    next:
    inc si
    inc si
  loop looping
  
  ;printing the odd average
  mov ax,oddSum
  mov bl,oddCount
  div bl
  mov ah,00
  call print_num 
  
  lea dx,[new]
  mov ah,9
  int 21h
  
  ;printing the even array
  mov si,[5000]
  call descendSort
  call printArray
  hlt
  
  stackingEven proc 
    mov ax,testing
    xchg ax,[di]
    inc di
    inc di
    inc evenCount
  ret
  
  descendSort proc
    mov dx,evenCount
    dec dx
    
    back:
        mov cx,dx
        lea si,[5000] 
        
    again:
        mov ax,[si]
        cmp ax,[si+2]
        jnc go
        xchg ax,[si+2]
        xchg ax,[si]
        
    go:
        inc si
        inc si
        loop again
        dec dx
        jnz back
    ret 
    
    printArray proc
    lea si,[5000]
    mov cx,evenCount
    printing:
        mov ax,[si]
        call print_num
        lea dx,[space]
        mov ah,9
        int 21h
        inc si
        inc si
    loop printing  
        lea dx,[new]
        mov ah,9
        int 21h
    ret               
  
  define_print_num
  define_print_num_uns

end start
ends
