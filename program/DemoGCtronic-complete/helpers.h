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
	close = 750, dmedium = 300, far = 100
} Distance;

typedef enum {
	h_length = 300, length = 550, great = 400, ultimate =  1400 // TODO: update decent name, can't think of anything rn
} Length;

// typedef enum {
//     front, back, right, left, unknown
// } SoundLocation;

typedef enum {
	left = 5, right = 2, front = 7, back = 4
} Direction;
void getProx(int*[8]);
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
void moveBackDistance(Length, Speed);
void spin();

// IR sensor
int _inProximity(Distance);
int inProximity(Distance, Direction);

// Sound
int isSoundInFront(int, int);
int getVolume(int);
void calibrateMic();

// Utility
void nwait(long);

#endif
