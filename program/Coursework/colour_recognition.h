#ifndef COLOUR
#define COLOUR

typedef enum {
	red, green, blue
} ColourType;

typedef enum {
	slow = 200, medium = 500, fast = 1000, nslow = -200, nmedium = -500, nfast = -1000
} Speed;

typedef enum {
	close = 250, far = 100
} Distance;

typedef enum {
	small = 100, decent = 200, great = 500 // TODO: update decent name, can't think of anything rn
} Length;

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
void moveDistance(Length, Speed, Speed);

#endif
