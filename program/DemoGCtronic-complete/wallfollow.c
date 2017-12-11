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
#include "wallfollow.h"


// This will make the puck parallel to the wall
void wallfollow() { 	// rename this to something that explains it a bit better

	int c_frontRight = e_get_prox(0);
	int c_frontLeft = e_get_prox(7);
	double c_diagLeft = e_get_prox(6);
	double c_left = e_get_prox(5);
	double ratio;

	int frontRight;
	int frontLeft;
	double diagLeft;
    double left;

	nforward(medium);

	while (1) {
		
 	    if(inProximity(close)) {
			frontRight = e_get_prox(0) - c_frontRight;
			frontLeft = e_get_prox(7) - c_frontLeft;
			diagLeft = e_get_prox(6) - c_diagLeft;
		    left = e_get_prox(5) - c_left;
		    ratio = left/diagLeft;	

	 	    e_set_speed_right(-500);
	 	    e_set_speed_left(500);

	 	    // when it is roughly parallel it is about 2x more 
	 	    // for the left one
	 	    while(ratio < 2) {
		 	    diagLeft = e_get_prox(6) - c_diagLeft;
			    left = e_get_prox(5) - c_left;
			    ratio = left/diagLeft;	
	 	    }
	 	    stop();
	 	    break;
 	    }
	}	
}
