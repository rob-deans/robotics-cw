#ifndef COLOUR
#define COLOUR

typedef enum {
	red, green, blue
} ColourType;

void ngetImage();
void nimage(ColourType, long*);
int nturnDirection(void);
void nturn(void);
void nforward();
int getCenterValue();

#endif
