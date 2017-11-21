#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/advance_one_timer/e_led.h"

#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "./findRed.h"
#include "./colour_recognition.h"

char fbwbuffer[160];
int numbuffer[80];
long isRedVisible;

void stop(void) {
	e_set_speed_right(0);
	e_set_speed_left(0);
}

int speed = 0;

void moveLeft() {
	e_set_speed_left(speed);
	e_set_speed_right(-speed);
	speed += 1;
}

void n_forward() {
	e_set_speed_left(500);
	e_set_speed_right(500);
}

void spin() {
	e_set_speed_left(500);
	e_set_speed_right(-500);	
}

//Main function of follower
void findRed(void){
	//basic set up for camera
	e_poxxxx_init_cam();
	// sensor_x1, sensor_y1, width, height, zoom width, zoom height, colour mode
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 

	// int i;
	// for(i=0;i<5000;i++) { asm("nop"); }

	e_start_agendas_processing();
	long isVisible;

	// spin();
	// e_activate_agenda(spin, 650);
	// int count = 0;

	while(1) {
	// 	// Get the images

		ngetImage();
		nimage(red, &isVisible);
		if(isVisible && getCenterValue() > 3) {  // If we have the specified colour visible set the led
			e_set_led(0, 1);
	// 		// e_destroy_agenda(spin);
	// 		n_forward();
	// 		// e_activate_agenda(n_forward, 100);
		} else {
	// 		// e_destroy_agenda(n_forward);
	// 		stop();
			e_led_clear();
		}
	}
	// e_activate_agenda(moveLeft, 500);
}

