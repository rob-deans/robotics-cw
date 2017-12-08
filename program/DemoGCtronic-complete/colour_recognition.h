#ifndef COLOUR
#define COLOUR

#define MIN_VOLUME = 1400;
#define FULL_SPIN_STEPS 1300

typedef enum {
	red, green, blue
} ColourType;

typedef enum {
	slow = 200, medium = 500, fast = 1000, nslow = -200, nmedium = -500, nfast = -1000
} Speed;

typedef enum {
	close = 600, far = 100
} Distance;

typedef enum {
	small = 100, decent = 200, great = 500, ultimate =  1500 // TODO: update decent name, can't think of anything rn
} Length;

// typedef enum {
//     front, back, right, left, unknown
// } SoundLocation;

typedef enum {
	left = 5, right = 2, front = 7, back = 4
} Direction;

// Camera
void initCamera();
void ngetImage();
void nimage(ColourType, long*);
int nturnDirection(void);
int isCenter();

// Movement
void nturn(void);
void nforward(Speed);
void backward(Speed);
void stop();
void moveDistance(Length, Speed);

// IR sensor
int inProximity(Distance);
int inProximity_v2(Distance, Direction);

// Sound
int isSoundInFront(int, int);
// SoundLocation soundLocation();
int getVolume(int);
void calibrateMic();

// Utility
void nwait(long);

#endif
