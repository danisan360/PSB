;nasm 2.11.08
%include "asm_io.inc"

section .data;
;variaveis inicializadas
msg1 db "Soma: ", 0 
msg2 db "Subtracao: ", 0
msg3 db "Multiplicacao: ", 0
msg4 db "Divisao: ", 0
msg5 db "Resto da divisao: ", 0


section .text
        global _asm_main

_asm_main:


;chama
call read_int
mov ebx,eax
;chama
call read_int

soma:
mov ecx,ebx
mov edx,eax
add ecx,edx
mov edx,eax
mov eax,msg1
call print_string
;printa
mov eax,ecx
call print_int
call print_nl
mov eax,edx

;sub:    ;
mov ecx,ebx
mov edx,eax
sub ecx,edx
;printa
mov edx,eax
mov eax,msg2
call print_string
;printa
mov eax,ecx
call print_int
call print_nl
mov eax,edx
mul:
mov ecx,ebx
mov edx,eax
imul ecx,edx
;printa
mov edx,eax
mov eax,msg3
call print_string
;printa
mov eax,ecx
call print_int
call print_nl
mov eax,edx

div: 
mov ecx, eax ; segundo numero em ecx, primeiro está em ebx
mov eax,ebx ; joga o primeiro em eax
cdq
idiv ecx
mov ebx, eax ;eax tta o result
mov eax,msg4
call print_string
mov eax,ebx
call print_int
call print_nl
mov eax, msg5
call print_string
mov eax,edx
call print_int
call print_nl
;printa eax
;printa edx


leave
ret

