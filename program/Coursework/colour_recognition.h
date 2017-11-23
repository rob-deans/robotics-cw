#ifndef COLOUR
#define COLOUR

typedef enum {
	red, green, blue
} ColourType;

typedef enum {
	slow = 200, medium = 500, fast = 1000
} Speed;

void setUpCamera();
void ngetImage();
void nimage(ColourType, long*);
int nturnDirection(void);
void nturn(void);
void nforward();
int isCenter();

#endif
