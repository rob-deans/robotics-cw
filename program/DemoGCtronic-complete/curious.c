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

#include "colour_recognition.h"
#include "curious.h"


void curious() {
    initCamera();
    e_start_agendas_processing();
    
    int initSteps = e_get_steps_left();
    int fullSpin = 1300;
    int multiple;
    int fullSpins = 0;
    long isVisible = 0;
    while(1) {           
        spin();
//        if (e_get_steps_left() > initSteps + fullSpin) {
//            initSteps = e_get_steps_left();
//            fullSpins++;  
//        }
        
        while(1) {
            // Puck is spinning... 
            ngetImage();
            nimage(red, &isVisible);
            if (isVisible && isCenter()) {              
                stop();
                break;
            }
        }
            
        int steps = e_get_steps_left();
        int stepsDiff = 0;
        nforward(medium);
        while(1) {
            if (inProximity(close)) {                
                stop();
                stepsDiff = e_get_steps_left() - steps;
                break;
            }
        }
        
        steps = e_get_steps_left();
        
        b();
        while(1) {
            if (steps - e_get_steps_left() >= stepsDiff) {
                e_set_led(0, 1);
                stop();
                break;
            }
        }
        
    }
}

void spin() {
    e_set_speed_left (500);
    e_set_speed_right(-500);
}

void b() {
    e_set_speed_left(-500);
    e_set_speed_right(-500);
}
