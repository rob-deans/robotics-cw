#include "p30F6014A.h"
#include "stdio.h"
#include "string.h"
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <motor_led/e_led.h>
#include <motor_led/e_motors.h>
#include <utility/utility.h>
#include <uart/e_uart_char.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <a_d/advance_ad_scan/e_prox.h>

#include "helpers.h"
#include "navigation.h"

// Navigates around a wall until it sees something
void navigateWall(int initLeft) {
	int initfrontRight = e_get_prox(0);
	int initfrontLeft = e_get_prox(7);

	while(checkLeft(initLeft)) {
		e_set_led(7, 1);
		followLeft(initLeft, initfrontLeft, initfrontRight);
	}
}

// may need to change this in the end
int checkLeft(int initLeft) {
	int left = e_get_prox(5) - initLeft;
	char buffer[40];
	sprintf(buffer, "Left, initLeft: %d, %d \r\n", left, initLeft);
	e_send_uart1_char(buffer, strlen(buffer));
	return left > 750;
}

// Make a 90 degree turn
void nturnLeft() {
	int initSteps = e_get_steps_right();

	e_set_speed_left(-500);
	e_set_speed_right(500);

	while(e_get_steps_right() < initSteps + (FULL_SPIN_STEPS / 4) - 10);

	stop();
}

// Follows the wall on the left until it sees something in the front
void followLeft(int initLeft, int initfrontLeft, int initfrontRight) {
	nforward(medium);
	while(1) {
		e_set_led(7, 0);
		if(e_get_prox(7) - initfrontLeft > 500 || e_get_prox(0) - initfrontRight > 500) {
			e_set_led(0, 1);
			nturnLeft();
			break;
		}

		if(!checkLeft(initLeft)) {
			e_set_led(6, 0);
			e_set_led(2, 1);
			moveDistance(h_length, medium);
			nturnLeft();
			nforward(medium);
			while(!checkLeft(initLeft));
			stop();
			break;
		}
	}
}
