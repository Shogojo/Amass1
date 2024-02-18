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
sbit LED_Sup at LATB2_bit;
sbit LED_Inf at LATB1_bit;
unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;
unsigned int e_ana1=0, e_ana2=0;
char cnt;
char kk;
float ff1;
char CRam1[20];

void interrupt(){
   USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
}
void Float2Ascii (float x, unsigned char *str,char precision)
{
 /* converts a floating point number to an ascii string */
 /* x is stored into str, which should be at least 30 chars long */
 int ie, i, k, ndig;
 double y;
 ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
 ie = 0;
 /* if x negative, write minus and reverse */
 if ( x < 0)
 {
   *str++ = '-';
   x = -x;
 }
 /* put x in range 1 <= x < 10 */
 if (x > 0.0) while (x < 1.0)
 {
   x *= 10.0;                // a la place de =*
   ie--;
 }
 while (x >= 10.0)
 {
   x = x/10.0;
   ie++;
 }
 // in f format, number of digits is related to size
 ndig += ie;                                // a la place de =+
 //round. x is between 1 and 10 and ndig will be printed to
 // right of decimal point so rounding is ...
 for (y = i = 1; i < ndig; i++)
 y = y/10.;
 x += y/2.;
 if (x >= 10.0) {x = 1.0; ie++;}
 if (ie<0)
 {
   *str++ = '0'; *str++ = '.';
   if (ndig < 0) ie = ie-ndig;
   for (i = -1; i > ie; i--)  *str++ = '0';
 }
 for (i=0; i < ndig; i++)
 {
   k = x;
   *str++ = k + '0';
   if (i ==  ie ) *str++ = '.';
   x -= (y=k);
   x *= 10.0;
  }
 *str = '\0';
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

      if (strncmp(&readbuff,"ADC",3)==0){
         e_ana1= adc_read(0);
         ff1=(float) e_ana1 * 5.00 /1024.0;
        // Float2Ascii (ff1, CRam1,2);
         sprintf( &writebuff,"ADC= % 5u    %04X  soit %2.2f Volts\r\n ",e_ana1,e_ana1,ff1);
      }
      else {
      //HID_Write(&writebuff,64);
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
        }
        //readbuff[0]=0;
        writebuff[0]=readbuff[0];
        writebuff[1]=readbuff[1];
        HID_Write(&writebuff,64);

      }
  /*  writebuff[1]=PORTB;
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
   */
   LED_Inf=(e_ana1<50)?1:0;
   LED_Sup=(e_ana1>950)?1:0;
   
  }
}