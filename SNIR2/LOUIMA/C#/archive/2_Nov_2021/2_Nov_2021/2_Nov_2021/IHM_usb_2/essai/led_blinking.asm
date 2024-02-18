
_main:

;led_blinking.c,1 :: 		void main() {
;led_blinking.c,3 :: 		for( ; ; )   	 	 	// Boucle sans fin
L_main0:
;led_blinking.c,5 :: 		TRISB = 0;   	// Configuration du PORTB  en sortie
	CLRF       TRISB+0
;led_blinking.c,6 :: 		PORTB.RB0 = 0;  	// RB0 = 0
	BCF        PORTB+0, 0
;led_blinking.c,7 :: 		delay_ms(1000);   	// Pause d'une seconde
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;led_blinking.c,8 :: 		PORTB.RB0 = 1;          // RB0 = 1
	BSF        PORTB+0, 0
;led_blinking.c,9 :: 		delay_ms(1000);   	// Pause d'une seconde
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;led_blinking.c,10 :: 		}   	 	 	 	 // Fin de la boucle
	GOTO       L_main0
;led_blinking.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
