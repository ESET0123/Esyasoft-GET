// Write a simple C Program that simulates a controlled LED blinking system with button input control

#include <stdio.h> // Standard input/output library (for printf)

int main(){
    int buttonControl, count=0;
    printf("Enter number of LED blinks: ");
    scanf("%d", &buttonControl);
    while(count<buttonControl){
        count++;
        printf("LED Blinks  %d\n", count);
    }
    if(count!=buttonControl){
        printf("Result failed");
    }else{
        printf("Exact number of blinks occured");
    }
}