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

#include "./love.h"
#include "./colour_recognition.h"

void __stop() {
	e_set_speed_left (0);
	e_set_speed_right(0);
}

void ninitCamera() {
    e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 
}

//Main function of follower
void love(void){
	ninitCamera();
    e_start_agendas_processing();
    
   	long isVisible;

	while(1) {

		ngetImage();      
        nimage(red, &isVisible);
        
        // if (checkProxSensor(150)) {
        //     e_set_led(7, 1);
        // }
        
		if(isVisible && isCenter()) {
			// It is red and in the center
			if(inProximity(close)) {
				e_set_led(0, 1);
				__stop();
			} else {
   		        nforward(fast);	
			}
        } else {
			e_led_clear();
            __stop();
		}

	}
}

