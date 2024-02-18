#line 1 "C:/Users/sylva/Documents/projet_pousse_seringue/IHM_usb_2/essai/led_blinking.c"
void main() {

 for( ; ; )
{
 TRISB = 0;
 PORTB.RB0 = 0;
 delay_ms(1000);
 PORTB.RB0 = 1;
 delay_ms(1000);
}

}
