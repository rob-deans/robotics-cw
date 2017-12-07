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
#include "./colour_recognition.h"

//Main function of follower
void love(void){
	initCamera();
    
   	long isVisible;
    
    int prevRightSteps = 0;
    int prevLeftSteps = 0;
    int rightSteps = 0;        
    int leftSteps = 0;
    
    e_set_led(0, 1);
    
    int wasVisible = 0;

	while(1) {

		ngetImage();      
        nimage(red, &isVisible);
        
		if((isVisible) || wasVisible) {
			// It is red and in the center
			if(inProximity(close)) {
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
                
			} else {
                if (wasVisible == 0) {
                    nforward(fast);	
                } else {
                    wasVisible = 0;
                }
            }
        } else {
            stop();
        }

	}
}

