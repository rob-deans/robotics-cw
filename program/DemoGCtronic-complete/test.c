#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "a_d/e_prox.h"
#include "motor_led/advance_one_timer/e_led.h"


#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "./test.h"
#include "./helpers.h"

//Love behaviour
void test(void) {

    char buffer[20];
    int prox[8];
    getProx(&prox);
    while(1) {

        int frontLeft = e_get_prox(7) - prox[7];
        int frontRight = e_get_prox(0) - prox[0];

        sprintf(buffer, "fl, fr %d, %d\r\n", frontLeft, frontRight);
        e_send_uart1_char(buffer, strlen(buffer));
    }
    
}

