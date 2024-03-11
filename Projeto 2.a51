Led			EQU P1
Is			EQU	P3.0
Ir			EQU	P3.1

CSEG	AT	0000H
JMP		Inicio
CSEG	At 0050H
	
Inicio:
	MOV Led, #10111101b			;Estado inicial
	
TestarIs:
	JB Is, TestarIr				;Se Ic = 1 -> TestarIr
	
	
	;---Inicio de Sequencia---
	;Esquerda 1
	MOV A, Led					;Passar Led para Acc
	RL A						;Rotar 
	MOV Led, A					;Passar Acc para Led
	CALL fun
	
	JNB Ir, Inicio				;Se Ir = 0 -> Inicio
	
	;Direita 2
	MOV A, Led					;Passar Led para Acc
	RR A						;Rotar 
	RR A						;Rotar
	MOV Led, A					;Passar Acc para Led
	CALL fun

	JNB Ir, Inicio				;Se Ir = 0 -> Inicio

	;Esquerda 3
	MOV A, Led					;Passar Led para Acc
	RL A						;Rotar 
	RL A						;Rotar
	RL A						;Rotar
	MOV Led, A					;Passar Acc para Led
	CALL fun
	
	JNB Ir, Inicio				;Se Ir = 0 -> Inicio
	
	;Direita 4
	MOV A, Led					;Passar Led para Acc
	RR A						;Rotar 
	RR A						;Rotar
	RR A						;Rotar 
	RR A						;Rotar
	MOV Led, A					;Passar Acc para Led
	CALL fun
	JMP TestarIs

TestarIr:
	JB Ir, TestarIs				;Se Ir = 1 -> TestarIs
	JMP Inicio


Fun:
	MOV R1, #0xFF
	MOV R2, #0xFF
	MOV R3, #0x10
	Loop: 
		DJNZ R1, Loop
		DJNZ R2, Loop
		DJNZ R3, Loop
	RET

JMP Inicio
END