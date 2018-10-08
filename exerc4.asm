;PS: o código deve estar dentro da pasta da biblioteca
%include "asm_io.inc"

segment .data
;variaveis inicializadas

msg1 db " ", 0


segment .bss ;variaveis nao inicializadas

vetor resd 10

segment .text ;codigo do programa
        global  _asm_main  ;caso estiver usando windows mudar para _asm_main
        
        
_asm_main: ;caso estiver usando windows mudar para _asm_main
        
        mov ebx,0
        mov ecx,10

lp:
		call read_int
		mov [vetor+ebx],eax
		add ebx,4
		loop lp

        mov ecx,10
		mov ebx,0
lp2:
		call read_int
		
		mov edx,ecx
 		mov ecx,10 
 		mov ebx,0
 lop3:		
		cmp eax,[vetor+ebx]
		jz igual
voltei:		
		
		add ebx,4
		loop lop3

		mov ecx,edx
		loop lp2		        
quit:        
        leave                     
        ret

igual:
	call print_int
	mov eax,msg1
	call print_string
	jmp voltei