
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,3 :: 		TRISB = 0;   	// Configuration du PORTB  en sortie
	CLRF       TRISB+0
;MyProject.c,4 :: 		while(1)
L_main0:
;MyProject.c,6 :: 		PORTB = 1;  	// RB0 = 0
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,7 :: 		for(i =0;i<8;i++)
	CLRF       R2+0
	CLRF       R2+1
L_main2:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      8
	SUBWF      R2+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,10 :: 		delay_ms(100);   	// Pause d'une seconde
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;MyProject.c,11 :: 		PORTB*=2;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,7 :: 		for(i =0;i<8;i++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,12 :: 		}   	 	 	 	 // Fin de la boucle
	GOTO       L_main2
L_main3:
;MyProject.c,13 :: 		for(i =0;i<8;i++)
	CLRF       R2+0
	CLRF       R2+1
L_main6:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      8
	SUBWF      R2+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,16 :: 		delay_ms(100);   	// Pause d'une seconde
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;MyProject.c,17 :: 		PORTB/=2;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,13 :: 		for(i =0;i<8;i++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,18 :: 		}
	GOTO       L_main6
L_main7:
;MyProject.c,19 :: 		}
	GOTO       L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
