#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "a_d/e_prox.h"
#include "motor_led/advance_one_timer/e_led.h"


#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "./love.h"
#include "./helpers.h"

//Love behaviour
void love(void){
	initCamera();
    
   	long isVisible;
    
    int prevRightSteps = 0;
    int prevLeftSteps = 0;
    int rightSteps = 0;        
    int leftSteps = 0;
    
    int wasVisible = 0;
    int initFrontLeft = e_get_prox(7);
    int initFrontRight = e_get_prox(0);
    int frontRight = 0;
    int frontLeft = 0;
    // getProx(&prox);
    char buffer[40];
	while(1) {
        ngetImage();
        nimage(red, &isVisible);
        
        frontLeft = e_get_prox(7) - initFrontLeft;
        frontRight = e_get_prox(0) - initFrontRight;
        e_set_led(0, 1);
        sprintf(buffer, "fl, ifl, fr, ifr %d, %d, %d, %d\r\n", frontLeft, initFrontLeft, frontRight, initFrontRight);
        e_send_uart1_char(buffer, strlen(buffer));
		if((isVisible) || wasVisible) {

			// It is red and in the center
			if(frontRight > 750 || frontLeft > 750) {

                // This creates the "nuzzle" effect
                wasVisible = 1;
                rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();
                

                e_set_speed_left(500);
                e_set_speed_right(-500);
                while (prevLeftSteps + 50 > leftSteps) {
                    leftSteps = e_get_steps_left();
                }
                e_set_speed_left(0);
                e_set_speed_right(0);
                
                rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();

                e_set_speed_left(-500);
                e_set_speed_right(500);
                while (prevRightSteps + 100 > rightSteps) {
                    rightSteps = e_get_steps_right();
                }
                
                rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();
                
                e_set_speed_left(500);
                e_set_speed_right(-500);
                while (prevLeftSteps + 50 > leftSteps) {
                    leftSteps = e_get_steps_left();
                }
                
                stop();
                prevLeftSteps = 0;
                prevRightSteps = 0;
                
			} else {
                sprintf(buffer, "not in range\r\n");
                e_send_uart1_char(buffer, strlen(buffer));
                if (wasVisible == 0) {
                    nforward(fast);	
                } else {
                    wasVisible = 0;
                }
            }
        } else {
            sprintf(buffer, "colour not visible %d %d\r\n", isVisible, isCenter());
            e_send_uart1_char(buffer, strlen(buffer));
            stop();
        }

	}
}

