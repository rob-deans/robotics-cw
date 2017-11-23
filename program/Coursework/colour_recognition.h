#ifndef COLOUR
#define COLOUR

typedef enum {
	red, green, blue
} ColourType;

typedef enum {
	slow = 200, medium = 500, fast = 1000
} Speed;

typedef enum {
	close = 500, far = 100
} Distance;

void setUpCamera();
void ngetImage();
void nimage(ColourType, long*);
int nturnDirection(void);
void nturn(void);
void nforward(Speed);
int isCenter();
int inProximity(Distance);
void backward(Speed);
void stop();

#endif
