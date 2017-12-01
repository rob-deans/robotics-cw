#include "./colour_recognition.h"
#include "uart/e_uart_char.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "a_d/e_micro.h"

#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "curious.h"

// int ngetVolume(int min) {
//     int m0, m1, m2;
//     e_get_micro(&m0, &m1, &m2);
//     return m0 > min || m1 > min || m2 > min;
// }

void curious() {
    int count = 0;

	e_start_agendas_processing();
	
    while(1) {

    	if(getVolume(1400)) {

    		e_led_clear();
    		e_set_led(1,1);

    		if (count == 0) {

                moveDistance(great, medium, nmedium);

                count = 1;
                wait(5000);

    		} else {

    			e_led_clear();
    			e_set_led(7,1);

                moveDistance(ultimate, medium, medium);

                count = 0;

    		}
    	} else {

    		e_led_clear();
    		e_set_led(2,1);
            
    	}
    }
}
