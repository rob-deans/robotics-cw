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

#include "./findRed.h"
#include "./colour_recognition.h"

char fbwbuffer[160];
int numbuffer[80];
long isRedVisible;

//custom cam picture load
void getImage(){
	e_poxxxx_launch_capture((char *)fbwbuffer);
    while(!e_poxxxx_is_img_ready()){};
}
// Image processing removes useless information
void Image(){	
	long i;
	int green, red, vis;
	for(i=0; i<80; i++){
		//RGB turned into an integer value for comparison
		red = (fbwbuffer[2*i] & 0xF8);
		green = (((fbwbuffer[2*i] & 0x07) << 5) | ((fbwbuffer[2*i+1] & 0xE0) >> 3));
		//blue = ((fbwbuffer[2*i+1] & 0x1F) << 3); we don't need blue for looking for red.
		if(red > green + 20){ // green will be less then red when red is strong.
			numbuffer[i] = 1;
			vis++;
		}else{
			numbuffer[i] = 0;
		}
		//If red is visable then isRedVisable turns to true
		if(vis>0){
			isRedVisible = 1;
		}else{
			isRedVisible = 0;
		}
	}	
}

//Decide which way to turn.
int turnDirection(){
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
//Function to deal with turning.
void turn(void) {
	if(turnDirection()){
		e_set_speed_left (500);
		e_set_speed_right(-500);
	}else{
		e_set_speed_left (-500);
		e_set_speed_right(500);
	}
}

void stop(void) {
	e_set_speed_right(0);
	e_set_speed_left(0);
}

int speed = 0;

void moveLeft() {
	e_set_speed_left(speed);
	speed += 10;
}

//Main function of follower
void findRed(void){
	//basic set up for camera
	e_poxxxx_init_cam();
	// sensor_x1, sensor_y1, width, height, zoom width, zoom height, colour mode
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 

	e_start_agendas_processing();

	e_activate_agenda(turn, 500);
}

