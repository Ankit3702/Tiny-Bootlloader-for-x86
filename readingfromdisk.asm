[org 0x7c00] ;originating our address
mov [BOOT_DISK], dl                 

                                    
xor ax, ax                          
mov es, ax ;extra segment, used for segmentation
mov ds, ax
mov bp, 0x8000
mov sp, bp

mov bx, 0x7e00

mov ah, 2
mov al, 1 ;no of sectors
mov ch, 0 ; cylinder nu
mov dh, 0 ;head no
mov cl, 2 ; sector no =2 
mov dl, [BOOT_DISK] ;drive number, which we save in a variable
int 0x13 
; interupt which prints the value at sector 1
; cylinder 0 , sector 2 and head 0

;(prints A)

mov ah, 0x0e
mov al, [0x7e00]
int 0x10
jmp $
BOOT_DISK: db 0

times 510-($-$$) db 0              
dw 0xaa55

times 512 db 'A'