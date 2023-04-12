.MODEL SMALL
.CODE

	MOV DL, 3Fh 
	MOV DH, DL 
	MOV CX, 4
	SHR DL,CL
	CMP DL, 10 ; Â¿es el nibble <10?
	JAE HEX_LETTER ; no convierte a letra
	ADD DL,"0" ; suma 30
	JMP SHORT WRITE_DIGIT ;escribe carÃ¡cter
HEX_LETTER:
	ADD DL, "A"-10 ;suma 37, convierte a letra hexadecimal
WRITE_DIGIT:
	CALL WRITE_CHAR ;despliega letra en la pantalla
	MOV DL, DH 
	AND DL, 0Fh 
	CMP DL, 10 ; Â¿es el nibble <10?
	JAE HEX_LETTER1 ; no convierte a letra
	ADD DL,"0" ; suma 30
	JMP SHORT WRITE_DIGIT2 ;escribe carÃ¡cter
HEX_LETTER1:
	ADD DL, "A"-10 ;suma 37, convierte a letra hexadecimal
WRITE_DIGIT2:
	CALL WRITE_CHAR ;despliega letra en la pantalla
	
.EXIT

PUBLIC WRITE_CHAR
WRITE_CHAR PROC
	PUSH AX
	MOV AH, 2 
	INT 21h 
	POP AX
	RET
WRITE_CHAR ENDP
END
