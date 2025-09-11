#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PD2
#define BUTTON_PIN PD3

int main(void){
    DDRD |= (1 << LED_PIN);
    DDRD &= ~(1 << BUTTON_PIN);
    PORTD |= (1 << BUTTON_PIN);


    while(1){
      if(!(PIND & (1 << BUTTON_PIN))){
        PORTD |= (1<<LED_PIN);//LED ON    
        _delay_ms(500);//DELAY 500ms

        PORTD &= ~(1<<LED_PIN);// LED OFF
        _delay_ms(500);// DELAY 500ms
      }
      else{
        PORTD &= ~(1<<LED_PIN);// LED OFF
      }
    }
}