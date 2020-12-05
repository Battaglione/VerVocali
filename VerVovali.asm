; ciclo while do  contatore da 0 a 9

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA
    vettore          DB    01h,'A' ,02h,03h,'A' ,0h,05h,'A' ,0h,07h,08h,09h,0Bh,'A',45,71,54,6,65,65,11,1,2,3,4,5,1,'$'
    conta1           DB    0 
    conta2           DB    0
.CODE                                                                                                
    
.STARTUP         
    lea si,vettore    
ciclo:        
    mov al,[si]
    cmp al,'$'
    jne nonuguale
    jmp resetvar
    jmp saltafine
nonuguale:
    inc conta1
    inc si
    jmp ciclo 
resetvar:
    mov si,0
    jmp contvocal1
contvocal1:
    mov al,[si]
    cmp al,41h
    jae contvocal2
    cmp al,'$'
    je saltafine
    inc si
    jmp contvocal1
contvocal2:
    cmp al,7Ah
    jbe contvocalfin
    inc si
    jmp contvocal1
contvocalfin:
    inc conta2
    inc si
    jmp contvocal1
    
saltafine: 
;servizio DOS di chiusura programma
    mov ax, 4c00h ; exit to operating system.
    int 21h    
END

