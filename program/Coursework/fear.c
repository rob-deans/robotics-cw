#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "codec/e_sound.h"
#include "a_d/e_micro.h"


#include "stdio.h"
#include "string.h"
#include "stdlib.h"


#include "./fear.h"
#include "./colour_recognition.h"


int getVolume(int min) {
    int m0, m1, m2;
    e_get_micro(&m0, &m1, &m2);
    return m0 > min || m1 > min || m2 > min;
}

void playSound() {
    e_play_sound(11028, 8016);
}

void run() {
    e_destroy_agenda(nturn);
    backward(fast);
    snake_led();
//    playSound();
}

//Main function of follower
void fear(void){
	//basic set up for the camera and 
	setUpCamera();	
	e_start_agendas_processing();
	e_init_sound();
    e_init_micro();
    
	long isVisible;
    int timer = 0;
    int tooLoud = 0;
    int wasTooLoud = 0;
    
    e_activate_agenda(nturn, 500);

	while(1){
		ngetImage();        
		e_led_clear();
		nimage(green, &isVisible);
        tooLoud = getVolume(1275);
        
        if (!tooLoud && !wasTooLoud) {
            if (isCenter() && isVisible) {
                run();
                timer++;
            }
            
            if (!isVisible) {
                e_activate_agenda(nturn, 500);
                timer = 0;
            }
        } else {
            if (tooLoud) {
                wasTooLoud = 1;
                run();
            }
            
            if (wasTooLoud) {
                timer++;
            }
            
            if (timer > 10) {
                e_activate_agenda(nturn, 500);
                timer = 0;
                wasTooLoud = 0;
            }
        }
	}
}
