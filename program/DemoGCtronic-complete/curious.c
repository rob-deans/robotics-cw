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

#include "helpers.h"
#include "curious.h"


void curious() {
    initCamera();
    e_start_agendas_processing();
    
    int initFrontLeft = e_get_prox(7);
    int initFrontRight = e_get_prox(0);
    int frontRight = 0;
    int frontLeft = 0;

    int initSteps = e_get_steps_left();
    int fullSpin = 1300;
    int multiple;
    int fullSpins = 0;
    long isVisible = 0;
    while(1) {           
        spin();
        
        while(1) {
            ngetImage();
            // Puck is spinning... 
            nimage(red, &isVisible);
            if (isVisible) {              
                stop();
                break;
            }
        }
            
        int steps = e_get_steps_left();
        int stepsDiff = 0;
        nforward(medium);
        while(1) {
            frontLeft = e_get_prox(7) - initFrontLeft;
            frontRight = e_get_prox(0) - initFrontRight;
            if (frontLeft > 750 || frontLeft > 750) {                
                stop();
                stepsDiff = e_get_steps_left() - steps;
                break;
            }
        }
        
        steps = e_get_steps_left();
        
        backward(medium);
        while(1) {
            if (steps - e_get_steps_left() >= stepsDiff) {
                e_set_led(0, 1);
                stop();
                break;
            }
        }
        
    }
}
