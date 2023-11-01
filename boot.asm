

; switching to teltype mode to print letters;
;mov ah,0x0e
;mov al, 'H'

; system interupt
;int 0x10
;mov ah,0x0e
;mov al, 'e'

;int 0x10
;mov ah,0x0e
;mov al, 'l'

;int 0x10
;mov ah,0x0e
;mov al, 'l'

;int 0x10
;mov ah,0x0e
;mov al, 'o'

;int 0x10
;jmp $

; times 510-($-$$) db 0
; db 0x55, 0xaa





[org 0x7c00]
jmp $

Disk: diskNum
mov ah,2 ; not sure what this is :(
mov al,1 ; CHS, we want to read 1 sectors
mov ch, 0; CHS, cylinder no 0
mov cl, 2; CHS, sector no 2;
mov dh, 0; CHS, head no.
mov dl, [diskNum] ;disk no.
; es:bx - 0x7e00 (extra segment)
mov es,0
mov bx,0x7e00
int 0x13  ;prints 'A'


; padding for the rest of the code to fill up 512 bytes of boot sector.
times 510-($-$$) db 0
db 0x55, 0xaa
times 512 db 'A' ;filling one sector with A's