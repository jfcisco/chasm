;===============
; Age
;===============

    .MODEL small
    .STACK 100
    .DATA
age db 18
young_prompt db "You are too young!", 0Dh, 0Ah, '$'
dating_prompt db "OK, you may go dating!", 0Dh, 0Ah, '$'
life_prompt db "So what do you want to do with your life?", 0Dh, 0Ah, '$'
    .CODE
main PROC near
    mov ax, @DATA
    mov ds, ax
    
    mov al, age
    cmp al, 17
    jl young
    cmp al, 18
    je dating
    mov dx, offset life_prompt
    jmp print_end
young:
    mov dx, offset young_prompt
    jmp print_end
dating:
    mov dx, offset dating_prompt
print_end:
    mov ah, 09h
    int 21h
    mov ah, 4Ch
    int 21h
main ENDP
    END
    
