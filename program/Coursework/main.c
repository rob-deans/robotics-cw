#include "p30f6014A.h"
#include "stdio.h"
#include "string.h"

#include "uart/e_uart_char.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "a_d/advance_ad_scan/e_prox.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "codec/e_sound.h"
#include "a_d/e_micro.h"

#include "aggressive.h"
#include "fear.h"
#include "love.h"



int getselector() {
	return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}

void off() {
    while(1) {
        e_led_clear();
        int i;
        for(i=0;i<10000;i++);
    }
}

int main() {
	int selector;

	e_init_port();
	e_init_sound();
    e_init_micro();
	e_init_motors();
	e_init_ad_scan(ALL_ADC);
	e_calibrate_ir();
	selector=getselector();
	
	switch(selector) {
		case 1: off(); break;
		case 2: love(); break;
		case 3: fear(); break;
		case 4: aggressive(); break;
		default: off();
	}
}

