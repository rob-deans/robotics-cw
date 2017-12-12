/********************************************************************************

			Programm to follow/avoid obstacles					          
			Version 2.0 août 2007				                          
			Michael Bonani, Jonathan Besuchet


This file is part of the e-puck library license.
See http://www.e-puck.org/index.php?option=com_content&task=view&id=18&Itemid=45

(c) 2004-2007 Michael Bonani, Jonathan Besuchet

Robotics system laboratory http://lsro.epfl.ch
Laboratory of intelligent systems http://lis.epfl.ch
Swarm intelligent systems group http://swis.epfl.ch
EPFL Ecole polytechnique federale de Lausanne http://www.epfl.ch

**********************************************************************************/

/*! \file
 * \brief Obstacles follower/avoider
 * \section sect1 Introduction
 * This demo is made to illustrate how to use the 8 proximities sensors.
 * \n The demo is divided in two programms:
 * - A programm to follow what is detected on the front of the e-puck
 * (for exemple another e-puck).
 * - A programm to avoid the obstacles.
 * 
 * These two programms work exactelly on the same way. First we do the
 * acquisition of the proxymities sensor and then we do a level-headed
 * sum of this acquisition. Finally we set the speed in concordance of
 * the level-headed sum.
 *
 * \section sect2 Playing the demo
 * \subsection subsect1 Playing the follower
 * First of all, move the selector to the position 4 and reset the e-puck.
 * The e-puck will go forward until he meets anything (it works good with
 * fingers or another e-puck). After that he will
 * follow him by staying always on the same distance.
 * \subsection subsect2 Playing the avoider
 * First of all, move the selector to the position 5 and reset the e-puck.
 * The e-puck will go forward until he meets an obstacle. At this time he
 * will find the better way to avoid him.
 *
 * \section sect3 Video of the demo
 * - The video of the follower demo: http://www.youtube.com/watch?v=6DYp5O1cnew
 * - The video of the avoider demo: http://www.youtube.com/watch?v=Y-RsvDyUfUE
 *
 * \author Code: Michael Bonani, Jonathan Besuchet \n Doc: Jonathan Besuchet
 */

#include "motor_led/e_init_port.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "a_d/advance_ad_scan/e_prox.h"

#include "./runbreitenberg_adv.h"


#include "motor_led/e_epuck_ports.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/e_epuck_ports.h"


#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include <codec/e_sound.h>

#include "./findRed.h"


#define PROXSCALING_FOLLOW 20
#define PROXSCALING_SHOCK 4
#define BASICSPEED 550

char gbuffer[160];
int gnumbuffer[80];
long isGreenVisable;

int i, s, m;
long potential[2];
int speed[2];
long ProxSensOffBuf[8];
int ui_lin = 0;

int factor_array[2][8] =
	{{-10,-30,15,0,0,-15,30,10},
	{10,30,-15,0,0,15,-30,-10}};

int matrix_prox[2][8] =
	{{8,4,2,0,0,-4,-8,-16},
	{-16,-8,-4,0,0,2,4,8}};

//custom cam picture load
void ggetImage(){
	e_poxxxx_launch_capture((char *)gbuffer);
    while(!e_poxxxx_is_img_ready()){};
}

// Image processing removes useless information
void gImage(){	
	long j;
	int green, red, blue, vis;
	for(j=0; j<80; j++){
		//RGB turned into an integer value for comparison
		red = (gbuffer[2*j] & 0xFF);
		green = (((gbuffer[2*j] & 0x07) << 5) | ((gbuffer[2*j+1] & 0xE0) >> 3));
		blue = ((gbuffer[2*j+1] & 0x1F) << 3);// we don't need blue for looking for green.
		if(blue > green + 20){ //Green is usually much higher then red due the the extra bit place in RGB565
			gnumbuffer[j] = 1;
			vis +=1;
		}else{
			gnumbuffer[j] = 0;
		}
		//If Green is visable then isRedVisable turns to true
		if(vis>0){
			isGreenVisable = 1;
		}else{
			isGreenVisable = 0;
		}
	}	
}

//Decide which way to turn based on the number of true pixels.
int gturnDirection(){
	int sumL = 0;
	int sumR = 0;
	int j;
	for(j=0;j<40;j++){
		sumL += gnumbuffer[j];
		sumR += gnumbuffer[j+40];
	}
	if(sumL<sumR){ 
		return 1;
	}else{
		return 0;
	}
}
//Function to deal with turning.
void gturn(void) {
	if(gturnDirection()){
		e_set_speed_left (500);
		e_set_speed_right(-500);
	}else{
		e_set_speed_left (-500);
		e_set_speed_right(500);
	}
}
void forward(void){
	e_set_speed_left (500);
	e_set_speed_right(500);
}

void ledFlash(void) {
	long j;
	e_set_led(0,1);
	e_set_led(1,1);
	e_set_led(7,1);

	for(j=0;j<300000;j++)
			asm("nop");

	e_set_led(0,0);
	e_set_led(1,0);
	e_set_led(7,0);

}












/*! \brief Calcul the speed to set on each wheel for avoiding
 *
 * Here we do a level-headed sum to take advantage of each captor
 * depending of there position. For exemple if the captor number 0
 * detect something, he has to set the right speed high and set 
 * the left speed low.
 */
void shock_neuron(void)
{
	for (m = 0; m < 2; m++)
	{
		potential[m] = 0;
		for (s = 0; s < 8; s++)
			potential[m] += (matrix_prox[m][s]*e_get_calibrated_prox(s)); // get values from proximity sensors
        speed[m] = (potential[m]/PROXSCALING_SHOCK + BASICSPEED);
	}

	if((speed[1] < 50 && speed[1] > -50)
		&& (speed[0] < 50 && speed[0] > -50)) {
		speed[1] = speed[1] * 20;
		speed[0] = speed[0] * 20;
	}

	if (speed[1] > 1000)
		speed[1] = 1000;
	else if (speed[1] < -1000 )
		speed[1] = -1000;

	if (speed[0] > 1000)
		speed[0] = 1000;
	else if (speed[0] < -1000 )
		speed[0] = -1000;

	e_set_speed_left(speed[1]);
	e_set_speed_right(speed[0]);
}

/*! \brief Calcul the speed to set on each wheel for following
 *
 * Here we do a level-headed sum to take advantage of each captor
 * depending of there position. For exemple if the captor number 0
 * detect something, he has to set the left speed high and set 
 * the right speed low.
 */
/*void follow_neuron(void)
{
	int basic_speed;

	speed[0] = 0;
	speed[1] = 0;
	
	for (m = 0; m < 2; m++)
		for (i = 0; i<8; i++)
			speed[m]  += e_get_calibrated_prox(i)*factor_array[m][i];
	
	basic_speed = 1000 - (e_get_calibrated_prox(7) + e_get_calibrated_prox(0))*2;
	//basic_speed = 1600 - (e_get_prox(7)-ProxSensOffBuf[7] + e_get_prox(0)-ProxSensOffBuf[0]);
	speed[1] = basic_speed + (speed[1]/PROXSCALING_FOLLOW);
	speed[0] = basic_speed + (speed[0]/PROXSCALING_FOLLOW);
	
	if (speed[0] > 1000)
		speed[0] = 1000;
	else if ( speed[0] < -1000 )
		speed[0] = -1000;
	if (speed[1] > 1000)
		speed[1] = 1000;
	else if ( speed[1] < -1000 )
		speed[1] = -1000;
	e_set_speed_left(speed[1]);
	e_set_speed_right(speed[0]);
}*/

int lin_speed_calc(int distance, int gain)
{
	int consigne = 100;
	float h = 0.05;
	int ti = 3;
	int ecart = consigne-distance;
	int lin_speed;

	ui_lin = ui_lin + h * ecart / ti;
	lin_speed = (ecart + ui_lin) * gain;

	if(lin_speed >= 1000)
	{
		ui_lin = 999/gain - ecart;
		if(ui_lin > 60)			// valeur aberrante vue sur matlab, donc on restreint à 40 la valeur de ui
			ui_lin = 60.0;
		lin_speed = 999;
	}
	else if(lin_speed <= -1000)
	{
		ui_lin = -999/gain + ecart;
		if(ui_lin < -10)		// valeur aberrante vue sur matlab, donc on restreint à -10 la valeur de ui
			ui_lin = -10.0;
		lin_speed = -999;
	}
	return lin_speed;
}

int angle_speed_calc(int pos, int gain)
{
	int consigne = 0;
	int angle_speed = 0;
	int ecart = consigne - pos;

	angle_speed = ecart*gain;

	if(angle_speed >= 1000)
		angle_speed = 999;
	else if(angle_speed <= -1000)
		angle_speed = -999;

	return angle_speed;
}

void follow_neuron(void)
{
	int lin_speed = lin_speed_calc((e_get_calibrated_prox(7)+e_get_calibrated_prox(0))/2, 6);
	int angle_speed = angle_speed_calc((e_get_calibrated_prox(0)+e_get_calibrated_prox(1)) -
										(e_get_calibrated_prox(7)+e_get_calibrated_prox(6)), 4);

	e_set_speed_left (lin_speed - angle_speed);
	e_set_speed_right(lin_speed + angle_speed);
}

/*! \brief The "main" function of the follower demo */
void run_breitenberg_follower(void)
{
	e_calibrate_ir();

	e_activate_agenda(k2000_led, 2500);
	e_activate_agenda(follow_neuron, 650);
	e_start_agendas_processing();
	while(1);
}

/*! \brief The "main" function of the avoider demo */

int inProximity(Distance d) {

	int frontLeft = e_get_prox(7);
	int frontLeftLeft = e_get_prox(6);	
	int frontRight = e_get_prox(0);
	int frontRightRight = e_get_prox(1);	

	return frontRight > d || frontLeft > d || frontRightRight > d || frontLeftLeft > d;
}


void run_breitenberg_shocker(void)
{	
	//basic set up for the camera and 
	e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 

	e_start_agendas_processing();
	int centreValue;

	e_init_sound();
	e_init_ad_scan(ALL_ADC);
	e_init_motors();
	

	while(1){
		ggetImage();
		gImage();
		e_led_clear();
			
		if(inProximity(far)){ 
			e_calibrate_ir();
			e_activate_agenda(flow_led, 900);
			e_activate_agenda(shock_neuron, 650);
		}else{
			e_set_speed_left (500);
			e_set_speed_right(500);
		}

		//Take a section of the center, this means if there is an error with one it won't effect it as a whole.
		centreValue = gnumbuffer[38] + gnumbuffer[39] + gnumbuffer[40] + gnumbuffer[41] + gnumbuffer[42] + gnumbuffer[43]; // removes stray 
		if(centreValue > 3){ //If blue is not in the middle then it will go avoid
			//e_end_agendas_processing();			
			//e_destroy_agenda(gturn);
			//forward();
			e_destroy_agenda(shock_neuron);
			e_destroy_agenda(flow_led);
			ledFlash();
			e_play_sound(0, 2112);
			e_set_speed_left (0);
			e_set_speed_right(0);
			break;
		}
	}
}
