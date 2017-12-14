#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_led.h"


#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "codec/e_sound.h"

#include "aggressive.h"
#include "helpers.h"

void angryFlash(void) {

	e_set_led(0,1);
	e_set_led(1,1);
	e_set_led(7,1);

	nwait(50000);

	e_set_led(0,0);
	e_set_led(1,0);
	e_set_led(7,0);

}

//Main function of follower
void aggressive(void){
	//basic set up for the camera and 
	initCamera();	

	e_start_agendas_processing();
	e_init_sound();  // TODO: Uncomment for the demo
	long isVisible;

	while(1) {
		ngetImage();
		nimage(red, &isVisible);

		e_led_clear();

		if(isVisible && isCenter()) {
			stop();
			nforward(slow);
			angryFlash();
			e_play_sound(0, 2112);  // TODO: Uncomment for the demo
		} else {
			// e_activate_agenda(nturn, 650);
			spin();			
		}
	}
}
