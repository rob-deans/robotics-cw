#include "p30f6014A.h"
#include "stdio.h"
#include "string.h"

#include "uart/e_uart_char.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "uart/e_uart_char.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include <codec/e_sound.h>
// #include "a_d/advance_ad_scan/e_prox.h"

#include "imageCapture.h"
#include "findRed.h"
#include "followGreen.h"
#include "followYellow.h"
#include "aggressive.h"

int getselector() {
	return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}

int main() {
	int selector;

	e_init_port();
	e_init_motors();
	selector=getselector();
	
	switch(selector) {
		case 1: imageCapture(); break;
		case 2: findRed(); break;
		case 3: followGreen(); break;
		case 4: aggressive(); break;
		default: return 0;
	}

	// if (selector==0) {

	// } else if (selector==1) {
	// 	imageCapture();
	// } else if (selector==2) {
	// 	findRed();
	// } else if (selector==3) {
	// 	followGreen();
	// } else if (selector==4) {
	// 	aggressive();
	// } else if (selector==5) {

	// } else {

	// }
}

