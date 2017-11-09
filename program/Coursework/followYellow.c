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

#include "./followYellow.h"

char ybuffer[160];
int ynumbuffer[80];
long isYellowVisable;


//custom cam picture load
void ygetImage(){
	e_poxxxx_launch_capture((char *)ybuffer);
    while(!e_poxxxx_is_img_ready()){};
}
// Image processing removes useless information
void yImage(){	
	long i;
	int green, red, vis;
	for(i=0; i<80; i++){
		//RGB turned into an integer value for comparison
		red = (ybuffer[2*i] & 0xF8);
		green = (((ybuffer[2*i] & 0x07) << 5) | ((ybuffer[2*i+1] & 0xE0) >> 3));
		//blue = ((gfbwbuffer[2*i+1] & 0x1F) << 3); we don't need blue for looking for green.
		if(green > red + 50){ //Yellow is usually much higher then red due the the extra bit place in RGB565
			ynumbuffer[i] = 1;
			vis +=1;
		}else{
			ynumbuffer[i] = 0;
		}
		//If Yellow is visable then isRedVisable turns to true
		if(vis>0){
			isYellowVisable = 1;
		}else{
			isYellowVisable = 0;
		}
	}	
}

//Decide which way to turn based on the number of true pixels.
int yturnDirection(){
	int sumL = 0;
	int sumR = 0;
	int i;
	for(i=0;i<40;i++){
		sumL += ynumbuffer[i];
		sumR += ynumbuffer[i+40];
	}
	if(sumL<sumR){ 
		return 1;
	}else{
		return 0;
	}
}
//Function to deal with turning.
void yturn(void) {
	if(gturnDirection()){
		e_set_speed_left (500);
		e_set_speed_right(-500);
	}else{
		e_set_speed_left (-500);
		e_set_speed_right(500);
	}
}
void yforward(void){
	e_set_speed_left (500);
	e_set_speed_right(500);
}
//Main function of follower
void followYellow(void){
	//basic set up for the camera and 
	e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 

	e_start_agendas_processing();
	int centreValue;

	while(1){
		ygetImage();
		yImage();
		e_led_clear();

		//Take a section of the center, this means if there is an error with one it won't effect it as a whole.
		centreValue = ynumbuffer[38] + ynumbuffer[39] + ynumbuffer[40] + ynumbuffer[41] + ynumbuffer[42] + ynumbuffer[43]; // removes stray 
		if(centreValue > 3){ //If yellow is in the middle then it will go forward 
			e_destroy_agenda(yturn);
			yforward();
			e_set_led(0,1);
		}else if(isYellowVisable == 1){//If yellow isn't in the center but is visable then picks a direction to turn to face it
			e_activate_agenda(yturn, 650);
			e_set_led(1,1);
		}else{// if yellow isn't visible and no true values it will turn left
			e_destroy_agenda(yturn);
			e_set_speed_left (0);
			e_set_speed_right(0);
			e_set_led(2,1);
		}
	}
}

