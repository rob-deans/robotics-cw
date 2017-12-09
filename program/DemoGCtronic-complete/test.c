#include "p30F6014A.h"
#include "stdio.h"
//#include "stdlib.h"
#include "string.h"
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <motor_led/e_led.h>
//#include "./a_d/e_prox.h"
#include <motor_led/e_motors.h>
#include <utility/utility.h>
#include <uart/e_uart_char.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <a_d/advance_ad_scan/e_prox.h>

#include "colour_recognition.h"

void test() {

    e_start_agendas_processing();
    nforward(medium);
    while(1) {
    	if(inProximity_v2(close, front)) {
    		// turn right
    		stop();
    		break;
    	}
    }

	nturnRight();

	wait(5000);

	while(inProximity_v2(close, left)) {
		followLeft();	
	}
}

void nturnRight() {
	int initSteps = e_get_steps_left();

	e_set_speed_left(500);
	e_set_speed_right(-500);

	while(e_get_steps_left() < initSteps + (FULL_SPIN_STEPS / 4) - 10);

	stop();
}

void nturnLeft() {
	int initSteps = e_get_steps_right();

	e_set_speed_left(-500);
	e_set_speed_right(500);

	while(e_get_steps_right() < initSteps + (FULL_SPIN_STEPS / 4) - 10);

	stop();
}

void followLeft() {
	nforward(medium);
	while(1) {
		if(inProximity_v2(dmedium, front)) {
			nturnLeft();
			stop();
			break;
		}

		if(inProximity_v2(close, left)) {
			e_set_led(6, 1);
			// moveDistance(h_length, medium);
		} else {
			e_set_led(6, 0);
			moveDistance(h_length, medium);
			nturnLeft();
			nforward(medium);
			while(!inProximity_v2(close, left));
			stop();
			break;
		}
	}
}
