#line 1 "C:/Users/sylva/Documents/projet_pousse_seringue/IHM_usb_2/essai/MyProject.c"
void main() {
 int i;
 TRISB = 0;
 while(1)
 {
 PORTB = 1;
 for(i =0;i<8;i++)
 {

 delay_ms(100);
 PORTB*=2;
 }
 for(i =0;i<8;i++)
 {

 delay_ms(100);
 PORTB/=2;
 }
 }
}
