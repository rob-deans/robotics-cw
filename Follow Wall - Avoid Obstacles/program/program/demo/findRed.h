#ifndef _FINDRED
#define _FINDRED

void findRed(void);

typedef enum {
	close = 250, far = 500
} Distance;

// IR sensor
int inProximity(Distance);


#endif
