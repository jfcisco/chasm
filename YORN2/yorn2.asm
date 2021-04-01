;==============
; Yes or No 2
;==============

    .MODEL small
    .STACK 100
    .DATA
prompt db "Another? <Y/N>", 0Dh, 0Ah, '$'
    .CODE
main PROC near
    mov ax, @DATA       ; Forgetting to intialize data segment
    mov ds, ax          ; leads to summoning Cthulhu (weird stuff)

ASK:
    ; print message
    mov dx, offset prompt
    mov ah, 09h
    int 21h
    ; prompt a key via DOS interrupt
    mov ah, 01h
    int 21h
    ; check if pressed key is 'N'
    cmp al, 'N'
    je END_EXE
    jmp ASK
END_EXE:
    mov ah, 4Ch
    int 21h             ; 21h should be in hexadecimal
main ENDP
    END