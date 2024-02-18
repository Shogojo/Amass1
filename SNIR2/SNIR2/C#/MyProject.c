void main ()
{       int j;
        TRISB = 0;
        PORTB = 1;
     while (1)
     {
          PORTB = 1;
          
      for ( j= 0; j< 7; j++)
      {
         delay_ms(100);
         PORTB *=2;
         
       }

         for ( j= 0; j< 7; j++)
      {
         delay_ms(100);
         PORTB /=2;
       }
      }

}