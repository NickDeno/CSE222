#include "File2.h"
#include <stdio.h>

void testFunc(double p1[], double p2[], double p3[]);

int main(void) {
	double p1[] = {2,4};
	double p2[] = {-1,0};
	double p3[] = {2,0};
	testFunc(p1,p2,p3);
	double p4[] = {0,-4};
	double p5[] = {3,-2};
	double p6[] = {6,0};
	testFunc(p4,p5,p6);
	double p7[] = {-2,0};
	double p8[] = {2,7};
	double p9[] = {-1,4};
	testFunc(p7, p8, p9);
	return 0;

}

void testFunc(double p1[], double p2[], double p3[]) {
	printf("The points (%.1f, %.1f), (%.1f, %.1f), and (%.1f, %.1f):\n", p1[0],p1[1],p2[0],p2[1],p3[0],p3[1]);
	printf("Construct a right triagle: %s\n", isRightTriangle(p1[0], p1[1], p2[0], p2[1], p3[0], p3[1]) ? "true" : "false");
	printf("Are on one straight line(Colinear): %s\n", straightLine(p1[0], p1[1], p2[0], p2[1], p3[0], p3[1]) ? "true" : "false");
	printf("\n");
}