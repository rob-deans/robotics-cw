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
		accy=e_get_acc(1);
		saccy+=accy;
		wait(3000);
	}

	naccy0=(saccy>>5);
}

//Main function of follower
void push(void) {

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
		// Read accelerometer
		//gil e_get_acc(&accx, &accy, &accz);
		// accx=e_get_acc(0);
		accy=e_get_acc(1);

		accy-=naccy0;


		// sprintf(buffer, "Acc y values: %d, %d \r\n", accy, naccy0);
		// e_send_uart1_char(buffer, strlen(buffer));

		if(accy < -150) { // take average?
			stop();
			e_play_sound(2116, 1760);
			int vol0=0, vol1=0, vol2=0;
		    int offsetVol0=0, offsetVol1=0, offsetVol2=0;

		    offsetVol0 = e_get_micro_volume(0);
		    offsetVol1 = e_get_micro_volume(1);
		    offsetVol2 = e_get_micro_volume(2);
		    int VOLUME_THR = 1250;

			while(1) {
				vol0 = e_get_micro_volume(0)-offsetVol0;
		        vol1 = e_get_micro_volume(1)-offsetVol1;
		        vol2 = e_get_micro_volume(2)-offsetVol2;

		        if(vol0 > VOLUME_THR || vol2 > VOLUME_THR || vol2 > VOLUME_THR) {
					nforward(medium);
		        	while(1);
		        }
			}
		}
		// sprintf(buffer, "Calibration values: %d, %d, %d\r\n", accy);
		// e_send_uart1_char(buffer, strlen(buffer));
	}
}




void listen(void) {

	int vol0=0, vol1=0, vol2=0;
    int offsetVol0=0, offsetVol1=0, offsetVol2=0;

    offsetVol0 = e_get_micro_volume(0);
    offsetVol1 = e_get_micro_volume(1);
    offsetVol2 = e_get_micro_volume(2);
    int VOLUME_THR = 1250;

	while(1) {
		vol0 = e_get_micro_volume(0)-offsetVol0;
        vol1 = e_get_micro_volume(1)-offsetVol1;
        vol2 = e_get_micro_volume(2)-offsetVol2;

        if(vol0 > VOLUME_THR || vol2 > VOLUME_THR || vol2 > VOLUME_THR) {
			push();
        }
	}
}
