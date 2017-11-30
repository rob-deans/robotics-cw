#include "uart/e_uart_char.h"
#include "a_d/e_micro.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_led.h"

#include "./colour_recognition.h"


void curious() {
    SoundLocation sl;
    while(1) {
        sl = soundLocation();
        switch(sl) {
            case front: nforward(slow); break;
            case back: backward(slow); break; // Change to turn around
            case right:
                e_set_speed_left (500);
                e_set_speed_right(-500);
            case left:
                e_set_speed_left (-500);
                e_set_speed_right(500);
            case unknown: stop();
            default: stop();
        }
        wait(5000);
    }
}
