// Write a simple C Program that simulates a controlled LED blinking system with button input control

#include <stdio.h> // Standard input/output library (for printf)

int main(){
    while(1){
        printf("Enter 1 to test LED blinks and 2 to exit: ");
        int buttonControl;
        scanf("%d", &buttonControl);
        if(buttonControl == 1){
            printf("LED Blinked \n");
        }else if(buttonControl != 1){
            break;
        }
    }
}