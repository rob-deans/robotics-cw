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

int ngetVolume(int min) {
    int m0, m1, m2;
    e_get_micro(&m0, &m1, &m2);
    return m0 > min || m1 > min || m2 > min;
}

void curious() {
    int count = 0;
    int prevRightSteps = 0;
    int prevLeftSteps = 0;
    int rightSteps = 0;        
    int leftSteps = 0;

    int loud;
	e_start_agendas_processing();
	
    while(1) {
    	loud = ngetVolume(1400);
    	// vol = getVolume();
    	if(loud) {
    		e_led_clear();
    		e_set_led(1,1);
    		if (count == 0) {
    			// turn left
    			e_set_speed_left(500);
                e_set_speed_right(-500);

                rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();

                while (prevLeftSteps + 300 > leftSteps) {
                    leftSteps = e_get_steps_left();
                }

                e_set_speed_left(0);
                e_set_speed_right(0);

                rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();
                count = 1;
                wait(5000);
    		} else {
    			e_led_clear();
    			e_set_led(7,1);
    			nforward(medium);

    			rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();

                while (prevLeftSteps + 1500 > leftSteps) {
                    leftSteps = e_get_steps_left();
                }

    			stop();
                count = 0;
    		}
    	} else {
    		e_led_clear();
    		e_set_led(2,1);
    	}
    }
}
