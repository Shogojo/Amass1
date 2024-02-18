void main() {
     int i;
     TRISB = 0;   	// Configuration du PORTB  en sortie
   while(1)
   {  	 	 	// Boucle sans fin
   PORTB = 1;  	// RB0 = 0
      for(i =0;i<8;i++)
      {

	delay_ms(100);   	// Pause d'une seconde
	PORTB*=2;
     }   	 	 	 	 // Fin de la boucle
     for(i =0;i<8;i++)
      {

	delay_ms(100);   	// Pause d'une seconde
	PORTB/=2;
     }
     }
}