/*	Author: cdiaz021
 *  Partner(s) Name: Jacob Halvorson
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) 
{
    /* Insert DDR and PORT initializations */
    DDRB = 0xFF;        PORTB = 0x00;
    DDRA = 0x00;	PORTA = 0xFF;
    /* Insert your solution below */
    unsigned char Door = 0x00;
    unsigned char Light = 0x00;
    unsigned char LED = 0x00;
    while (1) 
    {
	    Door = PINA & 0x01;
	    Light = PINA & 0x02;
	    
	    if((Door == 0x01) && (Light == 0x00))
	    {
		    LED = 0x01;
	    }
	    else
	    {
		    LED = 0x00;
	    }

	    PORTB = LED;
    }
    return 0;
}
