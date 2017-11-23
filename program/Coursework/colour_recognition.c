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

char newbuffer[160];
int newnumbuffer[80];

void setUpCamera() {
	e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 
}

void ngetImage() {
	e_poxxxx_launch_capture((char *)newbuffer);
    while(!e_poxxxx_is_img_ready()){};
}

// No idea if this will work
void nimage(ColourType col, long *isVisible){
	long i;  // Counter
	int green_c, red_c, blue_c, vis;
	*isVisible = 0;
	vis = 0;
    int greenBias = 20;

	for(i=0; i<80; i++) {
		//RGB turned into an integer value for comparison
		green_c = (((newbuffer[2*i] & 0x07) <<5) | ((newbuffer[2*i+1] & 0xE0) >> 3));
		red_c = (newbuffer[2*i] & 0xF8);
		blue_c = ((newbuffer[2*i+1] & 0x1F) << 3);

        
        switch(col) {
            case red: 
                if(red_c > green_c + greenBias){ // green will be less then red when red is strong.
                	newnumbuffer[i] = 1;
                    vis++;
                } else {
                    newnumbuffer[i] = 0;
                }
                break;
            case green:
                if(green_c > red_c + greenBias){ //Green is usually much higher then red due the the extra bit place in RGB565
                    newnumbuffer[i] = 1;
                    vis++;
                } else {
                    newnumbuffer[i] = 0;
                }
                break;
            case blue:
                if(blue_c > green_c && blue_c > red_c) {
                    newnumbuffer[i] = 1;
                    vis++;
                } else {
                    newnumbuffer[i] = 0;
                }
                break;
        }
	}
		
    //If Green is visible then isGreenVisable turns to true
    if(vis > 0){
        *isVisible = 1;
    }else{
        *isVisible = 0;
    }
}

int isCenter() {
	return (newnumbuffer[38] + newnumbuffer[39] + newnumbuffer[40] + newnumbuffer[41] + newnumbuffer[42] + newnumbuffer[43]) > 3; // removes stray 
}

int nturnDirection() {
	int sumL = 0;
	int sumR = 0;
	int i;
	for(i=0;i<40;i++){
		sumL += newnumbuffer[i];
		sumR += newnumbuffer[i+40];
	}
	if(sumL<sumR){
		return 1;
	}else{
		return 0;
	}
}

void nturn(void) {
	if(nturnDirection()){
		e_set_speed_left (500);
		e_set_speed_right(-500);
	}else{
		e_set_speed_left (-500);
		e_set_speed_right(500);
	}
}

void nforward(Speed speed) {
	e_set_speed_left (speed);
	e_set_speed_right(speed);
}

int inProximity(Distance d) {

	int frontLeft = e_get_prox(7);;
	int frontRight = e_get_prox(0);	

	return frontRight > d && frontLeft > d;
}
void backward(Speed speed) {
	e_set_speed_left (-speed);
	e_set_speed_right(-speed);
}

void stop() {
    e_set_speed_left (0);
	e_set_speed_right(0);
}
