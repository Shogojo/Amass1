#line 1 "C:/Users/sylva/Documents/projet_pousse_seringue/IHM_usb_2/HID_Terminal_ADC/HID_Read_Write_Interrupt.c"
#line 28 "C:/Users/sylva/Documents/projet_pousse_seringue/IHM_usb_2/HID_Terminal_ADC/HID_Read_Write_Interrupt.c"
sbit LED_Sup at LATB2_bit;
sbit LED_Inf at LATB1_bit;
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;
unsigned int e_ana1=0, e_ana2=0;
char cnt;
char kk;
float ff1;
char CRam1[20];

void interrupt(){
 USB_Interrupt_Proc();
}
void Float2Ascii (float x, unsigned char *str,char precision)
{


 int ie, i, k, ndig;
 double y;
 ndig = ( precision<=0) ? 7 : (precision > 22 ? 23 : precision+1);
 ie = 0;

 if ( x < 0)
 {
 *str++ = '-';
 x = -x;
 }

 if (x > 0.0) while (x < 1.0)
 {
 x *= 10.0;
 ie--;
 }
 while (x >= 10.0)
 {
 x = x/10.0;
 ie++;
 }

 ndig += ie;


 for (y = i = 1; i < ndig; i++)
 y = y/10.;
 x += y/2.;
 if (x >= 10.0) {x = 1.0; ie++;}
 if (ie<0)
 {
 *str++ = '0'; *str++ = '.';
 if (ndig < 0) ie = ie-ndig;
 for (i = -1; i > ie; i--) *str++ = '0';
 }
 for (i=0; i < ndig; i++)
 {
 k = x;
 *str++ = k + '0';
 if (i == ie ) *str++ = '.';
 x -= (y=k);
 x *= 10.0;
 }
 *str = '\0';
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

 if (strncmp(&readbuff,"ADC",3)==0){
 e_ana1= adc_read(0);
 ff1=(float) e_ana1 * 5.00 /1024.0;

 sprintf( &writebuff,"ADC= % 5u    %04X  soit %2.2f Volts\r\n ",e_ana1,e_ana1,ff1);
 }
 else {

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
 }

 writebuff[0]=readbuff[0];
 writebuff[1]=readbuff[1];
 HID_Write(&writebuff,64);

 }
#line 173 "C:/Users/sylva/Documents/projet_pousse_seringue/IHM_usb_2/HID_Terminal_ADC/HID_Read_Write_Interrupt.c"
 LED_Inf=(e_ana1<50)?1:0;
 LED_Sup=(e_ana1>950)?1:0;

 }
}
