;PS: o código deve estar dentro da pasta da biblioteca
%include "asm_io.inc"

segment .data
;variaveis inicializadas

var dd 128
soma dd 0
msg1 db "foi 1 sim",0

segment .bss ;variaveis nao inicializadas



segment .text ;codigo do programa
        global  _asm_main  ;caso estiver usando windows mudar para _asm_main
        
        
_asm_main: ;caso estiver usando windows mudar para _asm_main
        
        mov ecx, 8
        mov ebx,2
        lp:
        ;mov eax,[soma]
        ;call print_int
        ;call print_nl
        ;mov eax,[var]
        ;call print_int
        ;call print_nl
        call read_char ;le um caractere e guarda em al
        ;
        ;codigo referente qa manipulacao do caractere
        ;ex: cmp al, "0" ou cmp al, "1"
        ;
        cmp al,"1"
        jz nzero

poszero:
        mov eax,[var]
        cdq
        idiv ebx
        mov [var],eax

        loop lp

        mov eax,[soma]
        call print_int
        ;call print_nl

        leave                     
        ret

nzero:
        mov eax,msg1
        mov edx, [var]
        add edx,[soma]
        mov [soma],edx
        jmp poszero        













