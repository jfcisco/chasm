;============================
; HELLO.ASM
;============================

    .MODEL small
    .STACK 100                      ; Initialize 100-byte stack
    .DATA
msg db "Hello world!", 0Dh, 0Ah, '$'
    .CODE
main PROC far
    mov ax, @DATA           ; Initialize data segment
    mov ds, ax

    mov dx, offset msg      ; writeln("Hello world!")
    mov ah, 09h
    int 21h

    mov ah, 4Ch             ; Program terminate for .EXE files
    int 21h
main ENDP
    END