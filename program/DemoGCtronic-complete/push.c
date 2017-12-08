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
#include "colour_recognition.h"

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

	int accy;
	extern char buffer[60];

	// Init sound
	// e_init_acc();
	e_init_motors();
	e_init_sound();

	// Calibrate accelerometers
	e_set_led(8, 1);
	nacc_calibrate();
	sprintf(buffer, "Calibration values: %d \r\n", naccy0);
	e_send_uart1_char(buffer, strlen(buffer));
	e_set_led(8, 0);
	nforward(fast);

	while (1) {
		// only start checking the acc when close to an object
		if(inProximity(close)) {
			accy=e_read_acc_y(); // read the y axis acc i.e. the forward/back axis

			accy-=naccy0; // calculate the relative value

			// sprintf(buffer, "Acc y values: %d, %d \r\n", accy, naccy0);
			// e_send_uart1_char(buffer, strlen(buffer));

			// sometimes if it crashes it actually goes above 250 or so checking
			// that as well as deacceleration
			if(accy < -250 || accy > 250) { // take average?
				stop();

    			// e_play_sound(11028, 8016); // TODO: Uncomment when ready (for the trigger)

				nwait(1000000); // bugged, doesn't wait that long, increase? >100000

				_listen(_pushObject);
			}
		}
	}
}

void navigate() {
	
}

void listen() {
	_listen(push);
}

void _pushObject() {
	// e_play_sound(11028, 8016); // TODO: Uncomment when ready (for the trigger)
	nforward(fast);
	while(1);
}

// pass in a function that we want to run when we get over a certain limit
void _listen(void (*foo)()) {
	int vol0=0, vol1=0, vol2=0;
    int offsetVol0=0, offsetVol1=0, offsetVol2=0;

    offsetVol0 = e_get_micro_volume(0);
    offsetVol1 = e_get_micro_volume(1);
    offsetVol2 = e_get_micro_volume(2);
    int VOLUME_THR = 200;

	while(1) {
		vol0 = e_get_micro_volume(0)-offsetVol0;
        vol1 = e_get_micro_volume(1)-offsetVol1;
        vol2 = e_get_micro_volume(2)-offsetVol2;

        if(vol0 > VOLUME_THR || vol2 > VOLUME_THR || vol2 > VOLUME_THR) {
			(*foo)(); // the function when it is loud enough
        }
	}
}


