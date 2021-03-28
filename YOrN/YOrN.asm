;==============
; Yes or No
;==============

    .MODEL small
    .STACK 100      ; Initialize 100-byte stack segment.
    .DATA
; 0Dh and 0Ah correspond to Carriage Return and Line Feed, respectively
; '$' signifies the end of the stream in MS-DOS
prompt db "Press a Key Please!", 0Dh, 0Ah, '$' 
nomsg db "Your response is No!", 0Dh, 0Ah, '$'
yesmsg db "Your response is Yes!", 0Dh, 0Ah, '$'
    .CODE
main PROC far
    mov ax, @DATA   ; Initialize data segment.
    mov ds, ax

get_key:
    mov dx, offset prompt       ; writeln("Press a Key Please!")
    mov ah, 09h
    int 21h                     ; Calls function to write prompt
    mov ah, 01h                 ; read a key (and display it)
    int 21h                     ; Calls func to read a char
    cmp al, 'Y'                 ; is it a 'Y'
    je yes                      ; jump to yes if al equals 'Y'
    cmp al, 'N'
    je no
    jmp get_key
yes:
    mov dx, offset yesmsg       ; writeln("Your response is a Yes!")
    mov ah, 09h
    int 21h
    jmp endexe
no:
    mov dx, offset nomsg
    mov ah, 09h
    int 21h
endexe:
    mov ah, 4Ch                 ; Program terminate for .EXE files
    int 21h
main ENDP
    END