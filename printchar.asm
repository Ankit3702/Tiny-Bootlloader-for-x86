
; switching to teltype mode to print letters;
mov ah,0x0e
mov al, 'H'
int 0x10  ; system interupt

mov ah,0x0e
mov al, 'e'
int 0x10  ; system interupt

mov ah,0x0e
mov al, 'l'
int 0x10  ; system interupt

mov ah,0x0e
mov al, 'l'
int 0x10  ; system interupt

mov ah,0x0e
mov al, 'o'
int 0x10  ; system interupt

jmp $

times 510-($-$$) db 0
db 0x55, 0xaa