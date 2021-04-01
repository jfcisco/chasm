;=================================
; HELLO2.ASM
; 
; Prints the message in ALL CAPS
;=================================

    .MODEL small
    .STACK 100              ; Initialize 100-byte stack
    .DATA
msg db "Hello world!", 0Dh, 0Ah, '$'
    .CODE
main PROC far
    mov ax, @DATA           ; Initialize data segment
    mov ds, ax
    
    ; Convert all characters to uppercase
    
    ; Get first character
    lea bx, msg + 1    
    ; Setup counter to # of characters
    mov cx, 11

CONVERT:
    mov ah, [bx]            ; characters are 1 byte long?
    cmp ah, 61h
    jl NEXT_CHAR
    cmp ah, 7Ah
    jg NEXT_CHAR
    and ah, 11011111b       ; make lowercase using AND
    mov [bx], ah            ; replace char at bx

NEXT_CHAR:
    inc bx
    loop CONVERT 

    mov dx, offset msg      ; writeln("Hello world!")
    mov ah, 09h             ; indicates that stored string must be printed to std output
    int 21h                 ; calls the function at AH = 09

    mov ah, 4Ch             ; Program terminate for .EXE files
    int 21h
main ENDP
    END