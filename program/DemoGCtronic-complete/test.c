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
#include "test.h"

void test() {  // rename this

    e_start_agendas_processing();

	while(checkLeft()) {
		followLeft();
	}
}

// may need to change this in the end
int checkLeft() {
	return e_get_prox(5) > 1000;
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
			break;
		}

		if(!checkLeft()) {
			e_set_led(6, 0);
			e_set_led(2, 1);
			moveDistance(h_length, medium);
			nturnLeft();
			nforward(medium);
			while(!checkLeft());
			stop();
			break;
		}
	}
}
