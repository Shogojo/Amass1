
_interrupt:

;HID_Read_Write_Interrupt.c,35 :: 		void interrupt(){
;HID_Read_Write_Interrupt.c,36 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;HID_Read_Write_Interrupt.c,37 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_main:

;HID_Read_Write_Interrupt.c,39 :: 		void main(void){
;HID_Read_Write_Interrupt.c,40 :: 		ADCON1 = 0x0D;    // Configure all ports with analog function as digital  excepted RA1 and RA0
	MOVLW       13
	MOVWF       ADCON1+0 
;HID_Read_Write_Interrupt.c,41 :: 		CMCON  |= 7;      // Disable comparators
	MOVLW       7
	IORWF       CMCON+0, 1 
;HID_Read_Write_Interrupt.c,43 :: 		HID_Enable(&readbuff,&writebuff);  // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;HID_Read_Write_Interrupt.c,44 :: 		TRISB=0;
	CLRF        TRISB+0 
;HID_Read_Write_Interrupt.c,45 :: 		TRISA=0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;HID_Read_Write_Interrupt.c,46 :: 		TRISC|=0b11000001;
	MOVLW       193
	IORWF       TRISC+0, 1 
;HID_Read_Write_Interrupt.c,47 :: 		CCP1CON=0x0C;                      //PWM sur RC1
	MOVLW       12
	MOVWF       CCP1CON+0 
;HID_Read_Write_Interrupt.c,48 :: 		CCP2CON=0x0C;                      //PWM sur RC2
	MOVLW       12
	MOVWF       CCP2CON+0 
;HID_Read_Write_Interrupt.c,49 :: 		CCPR1L=00;
	CLRF        CCPR1L+0 
;HID_Read_Write_Interrupt.c,50 :: 		CCPR2L=00;
	CLRF        CCPR2L+0 
;HID_Read_Write_Interrupt.c,51 :: 		T2CON=0b00000110;   //T2on, PS=16 Freq=7500HZ
	MOVLW       6
	MOVWF       T2CON+0 
;HID_Read_Write_Interrupt.c,52 :: 		PR2=200;
	MOVLW       200
	MOVWF       PR2+0 
;HID_Read_Write_Interrupt.c,53 :: 		T0CON=0b00100000;   //T0off,16 bit,Counter,rising edge,,psa=1:Fcloclk/4
	MOVLW       32
	MOVWF       T0CON+0 
;HID_Read_Write_Interrupt.c,54 :: 		T1CON=0b10000010;    //16 bit, 1/4,Fosc/4,T1 off
	MOVLW       130
	MOVWF       T1CON+0 
;HID_Read_Write_Interrupt.c,55 :: 		T3CON=0b10010000;   // Timer 1 for Both CCPs        PS=1/2
	MOVLW       144
	MOVWF       T3CON+0 
;HID_Read_Write_Interrupt.c,56 :: 		TRISC=0b11111001; //RC1,RC2 outputs, the others inputs
	MOVLW       249
	MOVWF       TRISC+0 
;HID_Read_Write_Interrupt.c,58 :: 		while(1){
L_main0:
;HID_Read_Write_Interrupt.c,59 :: 		if (HID_Read()) {
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;HID_Read_Write_Interrupt.c,60 :: 		switch (readbuff[0]){
	GOTO        L_main3
;HID_Read_Write_Interrupt.c,61 :: 		case 1:  // ecriture des 8 sorties du port B
L_main5:
;HID_Read_Write_Interrupt.c,62 :: 		PORTB=readbuff[1];
	MOVF        1281, 0 
	MOVWF       PORTB+0 
;HID_Read_Write_Interrupt.c,63 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,64 :: 		case 2:  // reset comptage rapide  compteur RA4
L_main6:
;HID_Read_Write_Interrupt.c,65 :: 		T0CON.TMR0ON=0;
	BCF         T0CON+0, 7 
;HID_Read_Write_Interrupt.c,66 :: 		TMR0H=0;
	CLRF        TMR0H+0 
;HID_Read_Write_Interrupt.c,67 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;HID_Read_Write_Interrupt.c,68 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,69 :: 		case 3:  // reset comptage rapide compteur RC0
L_main7:
;HID_Read_Write_Interrupt.c,70 :: 		T1CON.TMR1ON=0;
	BCF         T1CON+0, 0 
;HID_Read_Write_Interrupt.c,71 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;HID_Read_Write_Interrupt.c,72 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;HID_Read_Write_Interrupt.c,73 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,74 :: 		case 4:   // demarrage compteur RA4
L_main8:
;HID_Read_Write_Interrupt.c,75 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;HID_Read_Write_Interrupt.c,76 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,77 :: 		case 5:    // demarrage compteur RC0
L_main9:
;HID_Read_Write_Interrupt.c,78 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;HID_Read_Write_Interrupt.c,79 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,80 :: 		case 6:   // arret compteur RA4
L_main10:
;HID_Read_Write_Interrupt.c,81 :: 		T0CON.TMR0ON=0;
	BCF         T0CON+0, 7 
;HID_Read_Write_Interrupt.c,82 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,83 :: 		case 7:   // arret compteur RC0
L_main11:
;HID_Read_Write_Interrupt.c,84 :: 		T1CON.TMR1ON=0;
	BCF         T1CON+0, 0 
;HID_Read_Write_Interrupt.c,85 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,86 :: 		case 8:   // Mise en route PWM1
L_main12:
;HID_Read_Write_Interrupt.c,87 :: 		CCPR1L=readbuff[2];
	MOVF        1282, 0 
	MOVWF       CCPR1L+0 
;HID_Read_Write_Interrupt.c,88 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,89 :: 		case 9:   // MIse en route PWM2
L_main13:
;HID_Read_Write_Interrupt.c,90 :: 		CCPR2L=readbuff[2];
	MOVF        1282, 0 
	MOVWF       CCPR2L+0 
;HID_Read_Write_Interrupt.c,91 :: 		break;
	GOTO        L_main4
;HID_Read_Write_Interrupt.c,92 :: 		}
L_main3:
	MOVF        1280, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVF        1280, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        1280, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        1280, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        1280, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        1280, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        1280, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
L_main4:
;HID_Read_Write_Interrupt.c,94 :: 		writebuff[0]=readbuff[0];
	MOVF        1280, 0 
	MOVWF       1344 
;HID_Read_Write_Interrupt.c,95 :: 		writebuff[1]=readbuff[1];
	MOVF        1281, 0 
	MOVWF       1345 
;HID_Read_Write_Interrupt.c,96 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;HID_Read_Write_Interrupt.c,105 :: 		}
L_main2:
;HID_Read_Write_Interrupt.c,106 :: 		writebuff[1]=PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       1345 
;HID_Read_Write_Interrupt.c,107 :: 		writebuff[2]= PORTC.RC7*16+PORTC.RC6*8+PORTC.RC0*4 +PORTA.RA5*2+PORTA.RA4;
	MOVLW       0
	BTFSC       PORTC+0, 7 
	MOVLW       1
	MOVWF       1346 
	RLCF        1346, 1 
	BCF         1346, 0 
	RLCF        1346, 1 
	BCF         1346, 0 
	RLCF        1346, 1 
	BCF         1346, 0 
	RLCF        1346, 1 
	BCF         1346, 0 
	CLRF        R2 
	BTFSC       PORTC+0, 6 
	INCF        R2, 1 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDWF       1346, 1 
	CLRF        R2 
	BTFSC       PORTC+0, 0 
	INCF        R2, 1 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDWF       1346, 1 
	CLRF        R2 
	BTFSC       PORTA+0, 5 
	INCF        R2, 1 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDWF       1346, 1 
	CLRF        R0 
	BTFSC       PORTA+0, 4 
	INCF        R0, 1 
	MOVF        R0, 0 
	ADDWF       1346, 1 
;HID_Read_Write_Interrupt.c,108 :: 		e_ana1= adc_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _e_ana1+0 
	MOVF        R1, 0 
	MOVWF       _e_ana1+1 
;HID_Read_Write_Interrupt.c,109 :: 		writebuff[3]=e_ana1 & 0xFF;
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       1347 
;HID_Read_Write_Interrupt.c,110 :: 		writebuff[4]=(e_ana1>>8) & 0x03;
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       3
	ANDWF       R2, 0 
	MOVWF       1348 
;HID_Read_Write_Interrupt.c,111 :: 		e_ana2= adc_read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _e_ana2+0 
	MOVF        R1, 0 
	MOVWF       _e_ana2+1 
;HID_Read_Write_Interrupt.c,112 :: 		writebuff[5]=e_ana2 & 0xFF;
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       1349 
;HID_Read_Write_Interrupt.c,113 :: 		writebuff[6]=(e_ana2>>8) & 0x03;
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       3
	ANDWF       R2, 0 
	MOVWF       1350 
;HID_Read_Write_Interrupt.c,114 :: 		writebuff[7]=TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       1351 
;HID_Read_Write_Interrupt.c,115 :: 		writebuff[8]=TMR0H;
	MOVF        TMR0H+0, 0 
	MOVWF       1352 
;HID_Read_Write_Interrupt.c,116 :: 		writebuff[9]=TMR1L;
	MOVF        TMR1L+0, 0 
	MOVWF       1353 
;HID_Read_Write_Interrupt.c,117 :: 		writebuff[10]=TMR1H;
	MOVF        TMR1H+0, 0 
	MOVWF       1354 
;HID_Read_Write_Interrupt.c,119 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;HID_Read_Write_Interrupt.c,120 :: 		}
	GOTO        L_main0
;HID_Read_Write_Interrupt.c,121 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
