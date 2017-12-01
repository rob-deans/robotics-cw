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
    e_start_agendas_processing();
    
   	long isVisible;

	while(1) {

		ngetImage();      
        nimage(red, &isVisible);
        
		if(isVisible && isCenter()) {
			// It is red and in the center
			if(inProximity(close)) {

                moveDistance(small, medium, nmedium);
                moveDistance(decent, nmedium, medium);
                moveDistance(small, medium, nmedium);

			} else {
                e_led_clear();
   		        nforward(fast);	
            }
        } else {
            e_led_clear();
            stop();
        }

	}
}

