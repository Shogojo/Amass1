
_interrupt:

;HID_Read_Write_Interrupt.c,38 :: 		void interrupt(){
;HID_Read_Write_Interrupt.c,39 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;HID_Read_Write_Interrupt.c,40 :: 		}
L_end_interrupt:
L__interrupt44:
	RETFIE      1
; end of _interrupt

_Float2Ascii:

;HID_Read_Write_Interrupt.c,41 :: 		void Float2Ascii (float x, unsigned char *str,char precision)
;HID_Read_Write_Interrupt.c,47 :: 		ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
	MOVF        FARG_Float2Ascii_precision+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_Float2Ascii0
	MOVLW       7
	MOVWF       ?FLOC___Float2AsciiT1+0 
	MOVLW       0
	MOVWF       ?FLOC___Float2AsciiT1+1 
	GOTO        L_Float2Ascii1
L_Float2Ascii0:
	MOVF        FARG_Float2Ascii_precision+0, 0 
	SUBLW       22
	BTFSC       STATUS+0, 0 
	GOTO        L_Float2Ascii2
	MOVLW       23
	MOVWF       ?FLOC___Float2AsciiT3+0 
	MOVLW       0
	MOVWF       ?FLOC___Float2AsciiT3+1 
	GOTO        L_Float2Ascii3
L_Float2Ascii2:
	MOVF        FARG_Float2Ascii_precision+0, 0 
	ADDLW       1
	MOVWF       ?FLOC___Float2AsciiT3+0 
	CLRF        ?FLOC___Float2AsciiT3+1 
	MOVLW       0
	ADDWFC      ?FLOC___Float2AsciiT3+1, 1 
L_Float2Ascii3:
	MOVF        ?FLOC___Float2AsciiT3+0, 0 
	MOVWF       ?FLOC___Float2AsciiT1+0 
	MOVF        ?FLOC___Float2AsciiT3+1, 0 
	MOVWF       ?FLOC___Float2AsciiT1+1 
L_Float2Ascii1:
	MOVF        ?FLOC___Float2AsciiT1+0, 0 
	MOVWF       Float2Ascii_ndig_L0+0 
	MOVF        ?FLOC___Float2AsciiT1+1, 0 
	MOVWF       Float2Ascii_ndig_L0+1 
;HID_Read_Write_Interrupt.c,48 :: 		ie = 0;
	CLRF        Float2Ascii_ie_L0+0 
	CLRF        Float2Ascii_ie_L0+1 
;HID_Read_Write_Interrupt.c,50 :: 		if ( x < 0)
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Float2Ascii4
;HID_Read_Write_Interrupt.c,52 :: 		*str++ = '-';
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	MOVLW       45
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Float2Ascii_str+0, 1 
	INCF        FARG_Float2Ascii_str+1, 1 
;HID_Read_Write_Interrupt.c,53 :: 		x = -x;
	BTG         FARG_Float2Ascii_x+2, 7 
;HID_Read_Write_Interrupt.c,54 :: 		}
L_Float2Ascii4:
;HID_Read_Write_Interrupt.c,56 :: 		if (x > 0.0) while (x < 1.0)
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Float2Ascii5
L_Float2Ascii6:
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Float2Ascii7
;HID_Read_Write_Interrupt.c,58 :: 		x *= 10.0;                // a la place de =*
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Float2Ascii_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_Float2Ascii_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_Float2Ascii_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_Float2Ascii_x+3 
;HID_Read_Write_Interrupt.c,59 :: 		ie--;
	MOVLW       1
	SUBWF       Float2Ascii_ie_L0+0, 1 
	MOVLW       0
	SUBWFB      Float2Ascii_ie_L0+1, 1 
;HID_Read_Write_Interrupt.c,60 :: 		}
	GOTO        L_Float2Ascii6
L_Float2Ascii7:
L_Float2Ascii5:
;HID_Read_Write_Interrupt.c,61 :: 		while (x >= 10.0)
L_Float2Ascii8:
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Float2Ascii9
;HID_Read_Write_Interrupt.c,63 :: 		x = x/10.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Float2Ascii_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_Float2Ascii_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_Float2Ascii_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_Float2Ascii_x+3 
;HID_Read_Write_Interrupt.c,64 :: 		ie++;
	INFSNZ      Float2Ascii_ie_L0+0, 1 
	INCF        Float2Ascii_ie_L0+1, 1 
;HID_Read_Write_Interrupt.c,65 :: 		}
	GOTO        L_Float2Ascii8
L_Float2Ascii9:
;HID_Read_Write_Interrupt.c,67 :: 		ndig += ie;                                // a la place de =+
	MOVF        Float2Ascii_ie_L0+0, 0 
	ADDWF       Float2Ascii_ndig_L0+0, 1 
	MOVF        Float2Ascii_ie_L0+1, 0 
	ADDWFC      Float2Ascii_ndig_L0+1, 1 
;HID_Read_Write_Interrupt.c,70 :: 		for (y = i = 1; i < ndig; i++)
	MOVLW       1
	MOVWF       Float2Ascii_i_L0+0 
	MOVLW       0
	MOVWF       Float2Ascii_i_L0+1 
	MOVLW       0
	MOVWF       Float2Ascii_y_L0+0 
	MOVLW       0
	MOVWF       Float2Ascii_y_L0+1 
	MOVLW       0
	MOVWF       Float2Ascii_y_L0+2 
	MOVLW       127
	MOVWF       Float2Ascii_y_L0+3 
L_Float2Ascii10:
	MOVLW       128
	XORWF       Float2Ascii_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Float2Ascii_ndig_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Float2Ascii46
	MOVF        Float2Ascii_ndig_L0+0, 0 
	SUBWF       Float2Ascii_i_L0+0, 0 
L__Float2Ascii46:
	BTFSC       STATUS+0, 0 
	GOTO        L_Float2Ascii11
;HID_Read_Write_Interrupt.c,71 :: 		y = y/10.;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        Float2Ascii_y_L0+0, 0 
	MOVWF       R0 
	MOVF        Float2Ascii_y_L0+1, 0 
	MOVWF       R1 
	MOVF        Float2Ascii_y_L0+2, 0 
	MOVWF       R2 
	MOVF        Float2Ascii_y_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Float2Ascii_y_L0+0 
	MOVF        R1, 0 
	MOVWF       Float2Ascii_y_L0+1 
	MOVF        R2, 0 
	MOVWF       Float2Ascii_y_L0+2 
	MOVF        R3, 0 
	MOVWF       Float2Ascii_y_L0+3 
;HID_Read_Write_Interrupt.c,70 :: 		for (y = i = 1; i < ndig; i++)
	INFSNZ      Float2Ascii_i_L0+0, 1 
	INCF        Float2Ascii_i_L0+1, 1 
;HID_Read_Write_Interrupt.c,71 :: 		y = y/10.;
	GOTO        L_Float2Ascii10
L_Float2Ascii11:
;HID_Read_Write_Interrupt.c,72 :: 		x += y/2.;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        Float2Ascii_y_L0+0, 0 
	MOVWF       R0 
	MOVF        Float2Ascii_y_L0+1, 0 
	MOVWF       R1 
	MOVF        Float2Ascii_y_L0+2, 0 
	MOVWF       R2 
	MOVF        Float2Ascii_y_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R4 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R5 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R6 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Float2Ascii_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_Float2Ascii_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_Float2Ascii_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_Float2Ascii_x+3 
;HID_Read_Write_Interrupt.c,73 :: 		if (x >= 10.0) {x = 1.0; ie++;}
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Float2Ascii13
	MOVLW       0
	MOVWF       FARG_Float2Ascii_x+0 
	MOVLW       0
	MOVWF       FARG_Float2Ascii_x+1 
	MOVLW       0
	MOVWF       FARG_Float2Ascii_x+2 
	MOVLW       127
	MOVWF       FARG_Float2Ascii_x+3 
	INFSNZ      Float2Ascii_ie_L0+0, 1 
	INCF        Float2Ascii_ie_L0+1, 1 
L_Float2Ascii13:
;HID_Read_Write_Interrupt.c,74 :: 		if (ie<0)
	MOVLW       128
	XORWF       Float2Ascii_ie_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Float2Ascii47
	MOVLW       0
	SUBWF       Float2Ascii_ie_L0+0, 0 
L__Float2Ascii47:
	BTFSC       STATUS+0, 0 
	GOTO        L_Float2Ascii14
;HID_Read_Write_Interrupt.c,76 :: 		*str++ = '0'; *str++ = '.';
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	MOVLW       48
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Float2Ascii_str+0, 1 
	INCF        FARG_Float2Ascii_str+1, 1 
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	MOVLW       46
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Float2Ascii_str+0, 1 
	INCF        FARG_Float2Ascii_str+1, 1 
;HID_Read_Write_Interrupt.c,77 :: 		if (ndig < 0) ie = ie-ndig;
	MOVLW       128
	XORWF       Float2Ascii_ndig_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Float2Ascii48
	MOVLW       0
	SUBWF       Float2Ascii_ndig_L0+0, 0 
L__Float2Ascii48:
	BTFSC       STATUS+0, 0 
	GOTO        L_Float2Ascii15
	MOVF        Float2Ascii_ndig_L0+0, 0 
	SUBWF       Float2Ascii_ie_L0+0, 1 
	MOVF        Float2Ascii_ndig_L0+1, 0 
	SUBWFB      Float2Ascii_ie_L0+1, 1 
L_Float2Ascii15:
;HID_Read_Write_Interrupt.c,78 :: 		for (i = -1; i > ie; i--)  *str++ = '0';
	MOVLW       255
	MOVWF       Float2Ascii_i_L0+0 
	MOVLW       255
	MOVWF       Float2Ascii_i_L0+1 
L_Float2Ascii16:
	MOVLW       128
	XORWF       Float2Ascii_ie_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Float2Ascii_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Float2Ascii49
	MOVF        Float2Ascii_i_L0+0, 0 
	SUBWF       Float2Ascii_ie_L0+0, 0 
L__Float2Ascii49:
	BTFSC       STATUS+0, 0 
	GOTO        L_Float2Ascii17
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	MOVLW       48
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Float2Ascii_str+0, 1 
	INCF        FARG_Float2Ascii_str+1, 1 
	MOVLW       1
	SUBWF       Float2Ascii_i_L0+0, 1 
	MOVLW       0
	SUBWFB      Float2Ascii_i_L0+1, 1 
	GOTO        L_Float2Ascii16
L_Float2Ascii17:
;HID_Read_Write_Interrupt.c,79 :: 		}
L_Float2Ascii14:
;HID_Read_Write_Interrupt.c,80 :: 		for (i=0; i < ndig; i++)
	CLRF        Float2Ascii_i_L0+0 
	CLRF        Float2Ascii_i_L0+1 
L_Float2Ascii19:
	MOVLW       128
	XORWF       Float2Ascii_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       Float2Ascii_ndig_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Float2Ascii50
	MOVF        Float2Ascii_ndig_L0+0, 0 
	SUBWF       Float2Ascii_i_L0+0, 0 
L__Float2Ascii50:
	BTFSC       STATUS+0, 0 
	GOTO        L_Float2Ascii20
;HID_Read_Write_Interrupt.c,82 :: 		k = x;
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       Float2Ascii_k_L0+0 
	MOVF        R1, 0 
	MOVWF       Float2Ascii_k_L0+1 
;HID_Read_Write_Interrupt.c,83 :: 		*str++ = k + '0';
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Float2Ascii_str+0, 1 
	INCF        FARG_Float2Ascii_str+1, 1 
;HID_Read_Write_Interrupt.c,84 :: 		if (i ==  ie ) *str++ = '.';
	MOVF        Float2Ascii_i_L0+1, 0 
	XORWF       Float2Ascii_ie_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Float2Ascii51
	MOVF        Float2Ascii_ie_L0+0, 0 
	XORWF       Float2Ascii_i_L0+0, 0 
L__Float2Ascii51:
	BTFSS       STATUS+0, 2 
	GOTO        L_Float2Ascii22
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	MOVLW       46
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Float2Ascii_str+0, 1 
	INCF        FARG_Float2Ascii_str+1, 1 
L_Float2Ascii22:
;HID_Read_Write_Interrupt.c,85 :: 		x -= (y=k);
	MOVF        Float2Ascii_k_L0+0, 0 
	MOVWF       R0 
	MOVF        Float2Ascii_k_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       Float2Ascii_y_L0+0 
	MOVF        R1, 0 
	MOVWF       Float2Ascii_y_L0+1 
	MOVF        R2, 0 
	MOVWF       Float2Ascii_y_L0+2 
	MOVF        R3, 0 
	MOVWF       Float2Ascii_y_L0+3 
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FARG_Float2Ascii_x+0, 0 
	MOVWF       R0 
	MOVF        FARG_Float2Ascii_x+1, 0 
	MOVWF       R1 
	MOVF        FARG_Float2Ascii_x+2, 0 
	MOVWF       R2 
	MOVF        FARG_Float2Ascii_x+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Float2Ascii_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_Float2Ascii_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_Float2Ascii_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_Float2Ascii_x+3 
;HID_Read_Write_Interrupt.c,86 :: 		x *= 10.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Float2Ascii_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_Float2Ascii_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_Float2Ascii_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_Float2Ascii_x+3 
;HID_Read_Write_Interrupt.c,80 :: 		for (i=0; i < ndig; i++)
	INFSNZ      Float2Ascii_i_L0+0, 1 
	INCF        Float2Ascii_i_L0+1, 1 
;HID_Read_Write_Interrupt.c,87 :: 		}
	GOTO        L_Float2Ascii19
L_Float2Ascii20:
;HID_Read_Write_Interrupt.c,88 :: 		*str = '\0';
	MOVFF       FARG_Float2Ascii_str+0, FSR1L+0
	MOVFF       FARG_Float2Ascii_str+1, FSR1H+0
	CLRF        POSTINC1+0 
;HID_Read_Write_Interrupt.c,89 :: 		}
L_end_Float2Ascii:
	RETURN      0
; end of _Float2Ascii

_main:

;HID_Read_Write_Interrupt.c,90 :: 		void main(void){
;HID_Read_Write_Interrupt.c,91 :: 		ADCON1 = 0x0D;    // Configure all ports with analog function as digital  excepted RA1 and RA0
	MOVLW       13
	MOVWF       ADCON1+0 
;HID_Read_Write_Interrupt.c,92 :: 		CMCON  |= 7;      // Disable comparators
	MOVLW       7
	IORWF       CMCON+0, 1 
;HID_Read_Write_Interrupt.c,94 :: 		HID_Enable(&readbuff,&writebuff);  // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;HID_Read_Write_Interrupt.c,95 :: 		TRISB=0;
	CLRF        TRISB+0 
;HID_Read_Write_Interrupt.c,96 :: 		TRISA=0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;HID_Read_Write_Interrupt.c,97 :: 		TRISC|=0b11000001;
	MOVLW       193
	IORWF       TRISC+0, 1 
;HID_Read_Write_Interrupt.c,98 :: 		CCP1CON=0x0C;                      //PWM sur RC1
	MOVLW       12
	MOVWF       CCP1CON+0 
;HID_Read_Write_Interrupt.c,99 :: 		CCP2CON=0x0C;                      //PWM sur RC2
	MOVLW       12
	MOVWF       CCP2CON+0 
;HID_Read_Write_Interrupt.c,100 :: 		CCPR1L=00;
	CLRF        CCPR1L+0 
;HID_Read_Write_Interrupt.c,101 :: 		CCPR2L=00;
	CLRF        CCPR2L+0 
;HID_Read_Write_Interrupt.c,102 :: 		T2CON=0b00000110;   //T2on, PS=16 Freq=7500HZ
	MOVLW       6
	MOVWF       T2CON+0 
;HID_Read_Write_Interrupt.c,103 :: 		PR2=200;
	MOVLW       200
	MOVWF       PR2+0 
;HID_Read_Write_Interrupt.c,104 :: 		T0CON=0b00100000;   //T0off,16 bit,Counter,rising edge,,psa=1:Fcloclk/4
	MOVLW       32
	MOVWF       T0CON+0 
;HID_Read_Write_Interrupt.c,105 :: 		T1CON=0b10000010;    //16 bit, 1/4,Fosc/4,T1 off
	MOVLW       130
	MOVWF       T1CON+0 
;HID_Read_Write_Interrupt.c,106 :: 		T3CON=0b10010000;   // Timer 1 for Both CCPs        PS=1/2
	MOVLW       144
	MOVWF       T3CON+0 
;HID_Read_Write_Interrupt.c,107 :: 		TRISC=0b11111001; //RC1,RC2 outputs, the others inputs
	MOVLW       249
	MOVWF       TRISC+0 
;HID_Read_Write_Interrupt.c,109 :: 		while(1){
L_main23:
;HID_Read_Write_Interrupt.c,110 :: 		if (HID_Read()) {
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
;HID_Read_Write_Interrupt.c,112 :: 		if (strncmp(&readbuff,"ADC",3)==0){
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr1_HID_Read_Write_Interrupt+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr1_HID_Read_Write_Interrupt+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
	MOVLW       0
	XORWF       R0, 0 
L__main53:
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
;HID_Read_Write_Interrupt.c,113 :: 		e_ana1= adc_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       _e_ana1+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _e_ana1+1 
;HID_Read_Write_Interrupt.c,114 :: 		ff1=(float) e_ana1 * 5.00 /1024.0;
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ff1+0 
	MOVF        R1, 0 
	MOVWF       _ff1+1 
	MOVF        R2, 0 
	MOVWF       _ff1+2 
	MOVF        R3, 0 
	MOVWF       _ff1+3 
;HID_Read_Write_Interrupt.c,116 :: 		sprintf( &writebuff,"ADC= % 5u    %04X  soit %2.2f Volts\r\n ",e_ana1,e_ana1,ff1);
	MOVLW       _writebuff+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_HID_Read_Write_Interrupt+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_HID_Read_Write_Interrupt+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_HID_Read_Write_Interrupt+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_sprintf_wh+8 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+9 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+10 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+11 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+12 
	CALL        _sprintf+0, 0
;HID_Read_Write_Interrupt.c,117 :: 		}
	GOTO        L_main27
L_main26:
;HID_Read_Write_Interrupt.c,120 :: 		switch (readbuff[0]){
	GOTO        L_main28
;HID_Read_Write_Interrupt.c,121 :: 		case 1:  // ecriture des 8 sorties du port B
L_main30:
;HID_Read_Write_Interrupt.c,122 :: 		PORTB=readbuff[1];
	MOVF        1281, 0 
	MOVWF       PORTB+0 
;HID_Read_Write_Interrupt.c,123 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,124 :: 		case 2:  // reset comptage rapide  compteur RA4
L_main31:
;HID_Read_Write_Interrupt.c,125 :: 		T0CON.TMR0ON=0;
	BCF         T0CON+0, 7 
;HID_Read_Write_Interrupt.c,126 :: 		TMR0H=0;
	CLRF        TMR0H+0 
;HID_Read_Write_Interrupt.c,127 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;HID_Read_Write_Interrupt.c,128 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,129 :: 		case 3:  // reset comptage rapide compteur RC0
L_main32:
;HID_Read_Write_Interrupt.c,130 :: 		T1CON.TMR1ON=0;
	BCF         T1CON+0, 0 
;HID_Read_Write_Interrupt.c,131 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;HID_Read_Write_Interrupt.c,132 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;HID_Read_Write_Interrupt.c,133 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,134 :: 		case 4:   // demarrage compteur RA4
L_main33:
;HID_Read_Write_Interrupt.c,135 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;HID_Read_Write_Interrupt.c,136 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,137 :: 		case 5:    // demarrage compteur RC0
L_main34:
;HID_Read_Write_Interrupt.c,138 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;HID_Read_Write_Interrupt.c,139 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,140 :: 		case 6:   // arret compteur RA4
L_main35:
;HID_Read_Write_Interrupt.c,141 :: 		T0CON.TMR0ON=0;
	BCF         T0CON+0, 7 
;HID_Read_Write_Interrupt.c,142 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,143 :: 		case 7:   // arret compteur RC0
L_main36:
;HID_Read_Write_Interrupt.c,144 :: 		T1CON.TMR1ON=0;
	BCF         T1CON+0, 0 
;HID_Read_Write_Interrupt.c,145 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,146 :: 		case 8:   // Mise en route PWM1
L_main37:
;HID_Read_Write_Interrupt.c,147 :: 		CCPR1L=readbuff[2];
	MOVF        1282, 0 
	MOVWF       CCPR1L+0 
;HID_Read_Write_Interrupt.c,148 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,149 :: 		case 9:   // MIse en route PWM2
L_main38:
;HID_Read_Write_Interrupt.c,150 :: 		CCPR2L=readbuff[2];
	MOVF        1282, 0 
	MOVWF       CCPR2L+0 
;HID_Read_Write_Interrupt.c,151 :: 		break;
	GOTO        L_main29
;HID_Read_Write_Interrupt.c,152 :: 		}
L_main28:
	MOVF        1280, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main31
	MOVF        1280, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main33
	MOVF        1280, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main34
	MOVF        1280, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
	MOVF        1280, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	MOVF        1280, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main37
	MOVF        1280, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main38
L_main29:
;HID_Read_Write_Interrupt.c,153 :: 		}
L_main27:
;HID_Read_Write_Interrupt.c,155 :: 		writebuff[0]=readbuff[0];
	MOVF        1280, 0 
	MOVWF       1344 
;HID_Read_Write_Interrupt.c,156 :: 		writebuff[1]=readbuff[1];
	MOVF        1281, 0 
	MOVWF       1345 
;HID_Read_Write_Interrupt.c,157 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;HID_Read_Write_Interrupt.c,159 :: 		}
L_main25:
;HID_Read_Write_Interrupt.c,173 :: 		LED_Inf=(e_ana1<50)?1:0;
	MOVLW       0
	SUBWF       _e_ana1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main54
	MOVLW       50
	SUBWF       _e_ana1+0, 0 
L__main54:
	BTFSC       STATUS+0, 0 
	GOTO        L_main39
	MOVLW       1
	MOVWF       ?FLOC___mainT87+0 
	GOTO        L_main40
L_main39:
	CLRF        ?FLOC___mainT87+0 
L_main40:
	BTFSC       ?FLOC___mainT87+0, 0 
	GOTO        L__main55
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
	GOTO        L__main56
L__main55:
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
L__main56:
;HID_Read_Write_Interrupt.c,174 :: 		LED_Sup=(e_ana1>950)?1:0;
	MOVF        _e_ana1+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVF        _e_ana1+0, 0 
	SUBLW       182
L__main57:
	BTFSC       STATUS+0, 0 
	GOTO        L_main41
	MOVLW       1
	MOVWF       ?FLOC___mainT89+0 
	GOTO        L_main42
L_main41:
	CLRF        ?FLOC___mainT89+0 
L_main42:
	BTFSC       ?FLOC___mainT89+0, 0 
	GOTO        L__main58
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
	GOTO        L__main59
L__main58:
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
L__main59:
;HID_Read_Write_Interrupt.c,176 :: 		}
	GOTO        L_main23
;HID_Read_Write_Interrupt.c,177 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
