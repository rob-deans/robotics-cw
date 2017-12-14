#include "p30F6014A.h"
#include "stdio.h"
#include "string.h"

#include <codec/e_sound.h>
#include <motor_led/e_init_port.h>
#include <motor_led/advance_one_timer/e_led.h>
#include <motor_led/advance_one_timer/e_motors.h>
#include <uart/e_uart_char.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_acc.h>
#include "math.h"
#include <utility/utility.h>
#include <a_d/advance_ad_scan/e_micro.h>

#include "push.h"
#include "navigation.h"
#include "orientate.h"
#include "helpers.h"

int naccy0;

void nacc_calibrate() {
	int i;
	int accy;
	long saccy;

	saccy=0;
	for (i=0; i<32; i++) {
		accy=e_read_acc_y();
		saccy+=accy;
		wait(3000);
	}

	naccy0=(saccy>>5);
}

//Main function of follower
void push() {

	int initLeft = e_get_prox(5);
    int left = 0;

	int accy;

	e_set_led(8, 1);
	// Calibrate accelerometers
	nacc_calibrate();

	e_set_led(8, 0);
	nforward(fast);

	while (1) {
		// only start checking the acc when close to an object
		if(inProximity(close, front)) {
			accy=e_read_acc_y(); // read the y axis acc i.e. the forward/back axis

			accy-=naccy0; // calculate the relative value

			if(accy < -250 || accy > 250) { 
				stop();

				e_play_sound(11028, 8016);

				while(1) {

					left = e_get_prox(5) - initLeft;

					if(left > 750) {
						e_set_led(6, 1);
						nwait(1000000);
						e_play_sound(11028, 8016);
						_pushObject();
					}
				}
			}
		}
	}
}

void navigate() {
	spin();
	// until we see the colour red
	long isVisible;
	initCamera();
	while(1) {
		ngetImage();
		nimage(red, &isVisible);

		// we have seen red and it is in the middle
		if(isVisible && isCenter()) {
			stop();
			break; // break out of the loop to start the wall following
		}
	}
	// parrallel park
	int initLeft = orientate();
	// // navigate the wall
	navigateWall(initLeft);
	// listen to push 
	_listen(_pushObject);
}

void listen() {
	e_start_agendas_processing();

	_listen(navigate);
}

void _pushObject() {
	nforward(fast);
	while(1);
}

// pass in a function that we want to run when we get over a certain limit
void _listen(void (*foo)()) {
	char buffer[20];
	int vol0=0, vol1=0, vol2=0;
    int offsetVol0=0, offsetVol1=0, offsetVol2=0;

    offsetVol0 = e_get_micro_volume(0);
    offsetVol1 = e_get_micro_volume(1);
    offsetVol2 = e_get_micro_volume(2);
    int VOLUME_THR = 75;

	while(1) {
		vol0 = e_get_micro_volume(0)-offsetVol0;
        vol1 = e_get_micro_volume(1)-offsetVol1;
        vol2 = e_get_micro_volume(2)-offsetVol2;

        sprintf(buffer, "%d %d %d\r\n", vol0, vol1, vol2);
        e_send_uart1_char(buffer, strlen(buffer));	
        if(vol0 > VOLUME_THR || vol2 > VOLUME_THR || vol2 > VOLUME_THR) {
			(*foo)(); // the function when it is loud enough
			break;
        }
	}
}


