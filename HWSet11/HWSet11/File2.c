#include <stdbool.h>
#include "File1.h"

bool isRightTriangle(double x0, double y0, double x1, double y1, double x2, double y2) {
	double d0 = calculateDistance(x0, y0, x1, y1);
	double d1 = calculateDistance(x1, y1, x2, y2);
	double d2 = calculateDistance(x0, y0, x2, y2);
	double greatest = findGreatest(d0, d1, d2);
	if (greatest == d0) {
		double temp = d0;
		d0 = d2;
		d2 = temp;
	}
	else if (greatest == d1) {
		double temp = d1;
		d1 = d2;
		d2 = temp;
	}
	return (((d0 * d0)+(d1 * d1)) == (d2 * d2));
}

bool straightLine(double x0, double y0, double x1, double y1, double x2, double y2) {
	double d0 = calculateDistance(x0, y0, x1, y1);
	double d1 = calculateDistance(x1, y1, x2, y2);
	double d2 = calculateDistance(x0, y0, x2, y2);
	double greatest = findGreatest(d0, d1, d2);
	if (greatest == d0) {
		double temp = d2;
		d2 = d0;
		d0 = temp;
	}
	else if (greatest == d1) {
		double temp = d1;
		d1 = d2;
		d2 = temp;
	}
	return ((d0 + d1) == d2);
}

