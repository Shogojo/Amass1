
_main:

;MyProject.c,1 :: 		void main ()
;MyProject.c,3 :: 		TRISB = 0;
	CLRF       TRISB+0
;MyProject.c,4 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,5 :: 		while (1)
L_main0:
;MyProject.c,7 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,9 :: 		for ( j= 0; j< 7; j++)
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
	MOVLW      7
	SUBWF      R2+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,11 :: 		delay_ms(100);
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
;MyProject.c,12 :: 		PORTB *=2;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,9 :: 		for ( j= 0; j< 7; j++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,14 :: 		}
	GOTO       L_main2
L_main3:
;MyProject.c,16 :: 		for ( j= 0; j< 7; j++)
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
	MOVLW      7
	SUBWF      R2+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,18 :: 		delay_ms(100);
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
;MyProject.c,19 :: 		PORTB /=2;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,16 :: 		for ( j= 0; j< 7; j++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,20 :: 		}
	GOTO       L_main6
L_main7:
;MyProject.c,21 :: 		}
	GOTO       L_main0
;MyProject.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
