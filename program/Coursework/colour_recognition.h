#ifndef COLOUR
#define COLOUR

typedef enum {
	red, green, blue
} ColourType;

void ngetImage(ColourType);
int nimage(ColourType);
int nturnDirection(void);
void nturn(void);
void nforward();

#endif
