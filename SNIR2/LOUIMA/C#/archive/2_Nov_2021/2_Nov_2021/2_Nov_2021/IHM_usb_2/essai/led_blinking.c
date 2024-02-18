void main() {

     for( ; ; )   	 	 	// Boucle sans fin
{
	TRISB = 0;   	// Configuration du PORTB  en sortie
        PORTB.RB0 = 0;  	// RB0 = 0
  	delay_ms(1000);   	// Pause d'une seconde
        PORTB.RB0 = 1;          // RB0 = 1
	delay_ms(1000);   	// Pause d'une seconde
}   	 	 	 	 // Fin de la boucle

}