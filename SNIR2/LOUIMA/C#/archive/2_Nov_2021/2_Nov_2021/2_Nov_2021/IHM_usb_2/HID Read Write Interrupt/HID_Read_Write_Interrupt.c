/*
 * Project name:
     HID_Read_Write_Interrupt (Testing the USB HID connection)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110929:
       - initial release (FJ);
 * Description:
     This example establishes connection with the HID terminal that is active
     on the PC. Upon connection establishment, the HID Device Name will appear
     in the respective window. After that software will wait for data and
     it will return received data back.
 * Test configuration:
     MCU:             PIC18F2550
                      http://ww1.microchip.com/downloads/en/DeviceDoc/39632D.pdf
     Dev.Board:       EasyPIC7 - ac:USB
                      http://www.mikroe.com/easypic/
     Oscillator:      HS, 8.000 MHz  (USB osc. is raised with PLL to 48.000MHz)
     Ext. Modules:    None.
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/mikroc/pic/
 * NOTES:
     (*) Be VERY careful about the configuration flags for the 18F4550 - there's
     so much place for mistake!
    - Place jumpers J12 in the right (USB) position.
 */

unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;
unsigned int e_ana1=0, e_ana2=0;
char cnt;
char kk;

void interrupt(){
   USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
}

void main(void){
  ADCON1 = 0x0D;    // Configure all ports with analog function as digital  excepted RA1 and RA0
  CMCON  |= 7;      // Disable comparators

  HID_Enable(&readbuff,&writebuff);  // Enable HID communication
  TRISB=0;
  TRISA=0xFF;
  TRISC|=0b11000001;
  CCP1CON=0x0C;                      //PWM sur RC1
  CCP2CON=0x0C;                      //PWM sur RC2
  CCPR1L=00;
  CCPR2L=00;
  T2CON=0b00000110;   //T2on, PS=16 Freq=7500HZ
  PR2=200;
  T0CON=0b00100000;   //T0off,16 bit,Counter,rising edge,,psa=1:Fcloclk/4
  T1CON=0b10000010;    //16 bit, 1/4,Fosc/4,T1 off
  T3CON=0b10010000;   // Timer 1 for Both CCPs        PS=1/2
  TRISC=0b11111001; //RC1,RC2 outputs, the others inputs
   
  while(1){
    if (HID_Read()) {
      switch (readbuff[0]){
             case 1:  // ecriture des 8 sorties du port B
                  PORTB=readbuff[1];
                  break;
             case 2:  // reset comptage rapide  compteur RA4
                   T0CON.TMR0ON=0;
                   TMR0H=0;
                   TMR0L=0;
                   break;
             case 3:  // reset comptage rapide compteur RC0
                  T1CON.TMR1ON=0;
                  TMR1H=0;
                  TMR1L=0;
                  break;
             case 4:   // demarrage compteur RA4
                  T0CON.TMR0ON=1;
                  break;
             case 5:    // demarrage compteur RC0
                  T1CON.TMR1ON=1;
                  break;
             case 6:   // arret compteur RA4
                  T0CON.TMR0ON=0;
                  break;
             case 7:   // arret compteur RC0
                  T1CON.TMR1ON=0;
                  break;
             case 8:   // Mise en route PWM1
                  CCPR1L=readbuff[2];
                  break;
             case 9:   // MIse en route PWM2
                  CCPR2L=readbuff[2];
                  break;
             }
      //readbuff[0]=0;
      writebuff[0]=readbuff[0];
      writebuff[1]=readbuff[1];
      HID_Write(&writebuff,64);
      /*if (readbuff[0]==0x80){
           PORTB=0xFF;
           readbuff[0]= 0;
           }
      else{
            PORTB=0;
            readbuff[0]= 0;
            }*/
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