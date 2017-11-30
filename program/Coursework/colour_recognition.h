#ifndef COLOUR
#define COLOUR

typedef enum {
	red, green, blue
} ColourType;

typedef enum {
	slow = 200, medium = 500, fast = 1000
} Speed;

typedef enum {
	close = 250, far = 100
} Distance;

typedef enum {
    front, back, right, left, unknown
} SoundLocation;

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

// IR sensor
int inProximity(Distance);

// Sound
int isSoundInFront(int, int);
SoundLocation soundLocation();

// Utility
void wait(int);

#endif
