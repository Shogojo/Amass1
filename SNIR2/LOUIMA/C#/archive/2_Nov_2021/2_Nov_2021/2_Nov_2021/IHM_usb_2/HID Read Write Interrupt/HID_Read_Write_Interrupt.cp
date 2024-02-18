#line 1 "C:/Users/sylva/OneDrive/Documents/projet_pousse_seringue/IHM_usb_2/HID Read Write Interrupt/HID_Read_Write_Interrupt.c"
#line 29 "C:/Users/sylva/OneDrive/Documents/projet_pousse_seringue/IHM_usb_2/HID Read Write Interrupt/HID_Read_Write_Interrupt.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;
unsigned int e_ana1=0, e_ana2=0;
char cnt;
char kk;

void interrupt(){
 USB_Interrupt_Proc();
}

void main(void){
 ADCON1 = 0x0D;
 CMCON |= 7;

 HID_Enable(&readbuff,&writebuff);
 TRISB=0;
 TRISA=0xFF;
 TRISC|=0b11000001;
 CCP1CON=0x0C;
 CCP2CON=0x0C;
 CCPR1L=00;
 CCPR2L=00;
 T2CON=0b00000110;
 PR2=200;
 T0CON=0b00100000;
 T1CON=0b10000010;
 T3CON=0b10010000;
 TRISC=0b11111001;

 while(1){
 if (HID_Read()) {
 switch (readbuff[0]){
 case 1:
 PORTB=readbuff[1];
 break;
 case 2:
 T0CON.TMR0ON=0;
 TMR0H=0;
 TMR0L=0;
 break;
 case 3:
 T1CON.TMR1ON=0;
 TMR1H=0;
 TMR1L=0;
 break;
 case 4:
 T0CON.TMR0ON=1;
 break;
 case 5:
 T1CON.TMR1ON=1;
 break;
 case 6:
 T0CON.TMR0ON=0;
 break;
 case 7:
 T1CON.TMR1ON=0;
 break;
 case 8:
 CCPR1L=readbuff[2];
 break;
 case 9:
 CCPR2L=readbuff[2];
 break;
 }

 writebuff[0]=readbuff[0];
 writebuff[1]=readbuff[1];
 HID_Write(&writebuff,64);
#line 105 "C:/Users/sylva/OneDrive/Documents/projet_pousse_seringue/IHM_usb_2/HID Read Write Interrupt/HID_Read_Write_Interrupt.c"
 }
 writebuff[1]=PORTB;
 writebuff[2]= PORTC.RC7*16+PORTC.RC6*8+PORTC.RC0*4 +PORTA.RA5*2+PORTA.RA4;
 e_ana1= adc_read(0);
 writebuff[3]=e_ana1 & 0xFF;
 writebuff[4]=(e_ana1>>8) & 0x03;
 e_ana2= adc_read(1);
 writebuff[5]=e_ana2 & 0xFF;
 writebuff[6]=(e_ana2>>8) & 0x03;
 writebuff[7]=TMR0L;
 writebuff[8]=TMR0H;
 writebuff[9]=TMR1L;
 writebuff[10]=TMR1H;

 HID_Write(&writebuff,64);
 }
}
