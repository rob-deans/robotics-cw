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

#include "./colour_recognition.h"

typedef enum {
	red, green, blue
} ColourType;

const int BUFFER = 160;
const int NUM_BUFFER = 80;

char buffer[BUFFER];
int numbuffer[NUM_BUFFER];
ColourType colourVisible;

//const int GREEN = (((buffer[2*i] & 0x07) <<5) | ((buffer[2*i+1] & 0xE0) >> 3));
//const int RED = (buffer[2*i] & 0xF8);
//const int BLUE = ((buffer[2*i+1] & 0x1F) << 3);

void getImage(ColourType col) {
	e_poxxxx_launch_capture((char *)buffer);
    while(!e_poxxxx_is_img_ready()){};
}

// No idea if this will work
void image(ColourType col){
	long i;  // Counter
	int green, red, vis;  // Colours and visibilty count??
	
	for(i=0; i<NUM_BUFFER; i++) {
		//RGB turned into an integer value for comparison
		red_c = (((buffer[2*i] & 0x07) <<5) | ((buffer[2*i+1] & 0xE0) >> 3));
		green_c = (buffer[2*i] & 0xF8);
		blue_c = ((buffer[2*i+1] & 0x1F) << 3);
		
		// Check for which colour is the most seen
		if (col == ColourType.green) {
			if(green_c > red_c + 50){ //Green is usually much higher then red due the the extra bit place in RGB565
				numbuffer[i] = 1;
				vis +=1;
			}else{
				numbuffer[i] = 0;
			}
		} else if(col == ColourType.red) {
			if(red_c > green_c + 20){ // green will be less then red when red is strong.
				numbuffer[i] = 1;
				vis++;
			}else{
				numbuffer[i] = 0;
			}
		} else if(col == ColourType.blue) {
			if(blue_c > green_c + 20) {
				numbuffer[i] = 1;
				vis++;
			} else {
				numbuffer[i] = 0;
			}
		}	

		return vis > 0;
		
		//If Green is visable then isGreenVisable turns to true
		/*if(vis > 0){
			isGreenVisable = 1;
		}else{
			isGreenVisable = 0;
		}*/
	}	
}

int turnDirection() {
	int sumL = 0;
	int sumR = 0;
	int i;
	for(i=0;i<40;i++){
		sumL += numbuffer[i];
		sumR += numbuffer[i+40];
	}
	if(sumL<sumR){
		return 1;
	}else{
		return 0;
	}
}

void turn(void) {
	if(turnDirection()){
		e_set_speed_left (500);
		e_set_speed_right(-500);
	}else{
		e_set_speed_left (-500);
		e_set_speed_right(500);
	}
}

void forward() {
	e_set_speed_left (500);
	e_set_speed_right(500);
}
