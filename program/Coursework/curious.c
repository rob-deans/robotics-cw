#include "./colour_recognition.h"
#include "uart/e_uart_char.h"

int ngetVolume(int min) {
    int m0, m1, m2;
    e_get_micro(&m0, &m1, &m2);

    // e_send_uart1_char('%d %d %d', 20);
    char uartbuffer[100];
    sprintf(uartbuffer, '%d %d %d', m0, m1, m2, 10);
    e_send_uart1_char(uartbuffer, strlen(uartbuffer));
    return m0 > min || m1 > min || m2 > min;
}
void curious() {
    int count = 0;
    // int vol = 0;
    int prevRightSteps = 0;
    int prevLeftSteps = 0;
    int rightSteps = 0;        
    int leftSteps = 0;

    
    e_init_uart1();	
	e_start_agendas_processing();
	
    while(1) {

    	// vol = getVolume();
    	if(ngetVolume(1250)) {
    		e_led_clear();
    		e_set_led(1,1);
    		if (count % 2 == 0) {
    			// turn left
    			e_set_speed_left(500);
                e_set_speed_right(-500);
                while (prevLeftSteps + 150 > leftSteps) {
                    leftSteps = e_get_steps_left();
                }

                e_set_speed_left(0);
                e_set_speed_right(0);

                rightSteps = prevRightSteps = e_get_steps_right();
                leftSteps = prevLeftSteps = e_get_steps_left();
                count++;
    		} else {
    			nforward(slow);
    			wait(5000);
    			stop();
                count++;
    		}
    	} else {
    		e_led_clear();
    		e_set_led(2,1);
    	}
    }
}
