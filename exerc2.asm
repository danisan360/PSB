;PS: o código deve estar dentro da pasta da biblioteca
%include "asm_io.inc"

segment .data
;variaveis inicializadas

msg1 db "Não é primo", 0
msg2 db "Primo", 0
msg3 db "Não é primo",0
var dw 0


segment .bss ;variaveis nao inicializadas

segment .text ;codigo do programa
        global  _asm_main  ;caso estiver usando windows mudar para _asm_main
        
        
_asm_main: ;caso estiver usando windows mudar para _asm_main
        
        ;le um inteiro
        call read_int   ;eax = inteiro do teclado
        
        ;inicializa i em ebx como 1 e p em ecx como 0
        mov ebx, 1 ; i = 1
        mov ecx, 0 ; p = 0

        ;comeco do loop
while:
        cmp eax,ebx ; enquanto i menor que o numero entrado, permanece no while
        jc poswhile        ;se não, pula pra dps do while
        ;call print_int
        ;call print_nl
        mov [var],eax ; salva o valor de eax em var pra n perde lo  na divisao
        cdq
        idiv ebx ; divide i por eax e salva o resto em edx
        mov eax,edx;
        ;call print_int
        ;call print_nl
        mov eax,[var] ;devolve o valor para eax
        cmp edx,0 ;se o modulo do resto = 0
        jnz posif
        add ecx,1

posif:        
        add ebx,1
        mov edx,0
        jmp while ; fecha o loop
poswhile:        
        mov edx,2
        mov eax,ecx

        add ecx,-2
        mov eax,ecx
        ;;call print_int
        ;call print_nl
        mov eax,edx
        ;call print_int
        ;call print_nl

        cmp ecx,0
        jnz nprim

        mov eax,msg2
        call print_string
        jmp saida
saida:
        ;;mov eax,ecx
        ;call print_int
        ;call print_nl
        ;sai do programa
        leave                     
        ret
nprim:
        ;mov eax,msg3
        ;call print_string
        ;call print_nl
        mov eax,msg1
        call print_string
        jmp saida
        