#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "a_d/advance_ad_scan/e_prox.h"
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

// int checkProxSensor(int distance) {   
//     int proxData[2];

// 	// get one single sample for all 8 sensors
// 	proxData[0] = e_get_prox(0);
//     proxData[1] = e_get_prox(7);

//     // Detect obstacle_present on any of the 8 sensors
// 	long obstaclePresentFar = 0;
    
//     if(proxData[0] > distance || proxData[1] > distance) {
//         obstaclePresentFar = 1;
//     }
// 	return obstaclePresentFar;   				
// }

void initCamera() {
    e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 
}

//Main function of follower
void findRed(void){
	initCamera();
    e_start_agendas_processing();
    
   	long isVisible;

	while(1) {

		ngetImage();      
        nimage(red, &isVisible);
        
        // if (checkProxSensor(150)) {
        //     e_set_led(7, 1);
        // }
        
		if(isVisible && isCenter()) {
			e_set_led(0, 1);
            n_forward();
        } else {
			e_led_clear();
            spin();
		}

	}
}

