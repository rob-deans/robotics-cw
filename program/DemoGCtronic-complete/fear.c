#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "codec/e_sound.h"
#include <a_d/advance_ad_scan/e_micro.h>

#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "./fear.h"
#include "./helpers.h"


void playSound() {
    e_play_sound(11028, 8016);
}

void getVol(void (*foo)()) {
    int vol0=0, vol1=0, vol2=0;
    int offsetVol0=0, offsetVol1=0, offsetVol2=0;

    offsetVol0 = e_get_micro_volume(0);
    offsetVol1 = e_get_micro_volume(1);
    offsetVol2 = e_get_micro_volume(2);
    int VOLUME_THR = 10000;

    while(1) {
        vol0 = e_get_micro_volume(0)-offsetVol0;
        vol1 = e_get_micro_volume(1)-offsetVol1;
        vol2 = e_get_micro_volume(2)-offsetVol2;

        if(vol0 > VOLUME_THR || vol2 > VOLUME_THR || vol2 > VOLUME_THR) {
            (*foo)(); // the function when it is loud enough
            break;
        }
    }
}

// Run "away" from what scared it
void run() {
    // e_play_sound(11028, 8016); // "Scream"
    snake_led();
    stop();

    e_activate_agenda(snake_led, 500);

    moveBackDistance(length, fast);

    spin();

    e_destroy_agenda(snake_led);

    e_led_clear();
}

// Fear behaviour
void fear(void){

	//basic set up for the camera and 
	initCamera();
	e_start_agendas_processing();
    e_init_sound();

	long isVisible;
    spin();

    nwait(500000);

    int vol0=0, vol1=0, vol2=0;
    int offsetVol0=0, offsetVol1=0, offsetVol2=0;

    offsetVol0 = e_get_micro_volume(0);
    offsetVol1 = e_get_micro_volume(1);
    offsetVol2 = e_get_micro_volume(2);
    int VOLUME_THR = 200;

	while(1) {
        ngetImage();
		nimage(green, &isVisible);
        vol0 = vol1 = vol2 = 0;
        // vol0 = e_get_micro_volume(0)-offsetVol0;
        // vol1 = e_get_micro_volume(1)-offsetVol1;
        // vol2 = e_get_micro_volume(2)-offsetVol2;
        if(vol0 > VOLUME_THR || vol1 > VOLUME_THR || vol2 > VOLUME_THR || (isVisible && isCenter())) {
            run();
        }
	}
}
