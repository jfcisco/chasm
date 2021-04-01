;=============================
; Repeat-Until Construct
; 
; Repeat asking Another? <Y/N>
; Until N is pressed
;=============================

    .MODEL small
    .STACK 100 
    ; can I run without setting stack size? Yes, but a warning is displayed
    .DATA
question db "Another? <Y/N>", 0Dh, 0Ah, '$'
    .CODE

main PROC near
    mov ax, @DATA   ; initialize data segment
    mov ds, ax

PROMPT:
    ; write question to std output
    mov dx, offset question
    mov ah, 09h
    int 21h

    ; get character from user
    mov ah, 07h
    int 21h
    
    cmp al, 'N'
    jne PROMPT
    
    ; exit program
    mov ah, 4Ch
    int 21h
    main ENDP
END