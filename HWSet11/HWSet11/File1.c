#include <math.h>

int findGreatest(int x, int y, int z) {
	int temp = (x > y) ? x : y;
	return (temp > z) ? temp : z;
}

int findSmallest(int x, int y, int z) {
	int temp = (x < y) ? x : y;
	return (temp < z) ? temp : z;
}

double calculateDistance(double x0, double y0, double x1, double y1) {
	return sqrt(((x1 - x0) * (x1 - x0)) + ((y1 - y0) * (y1 - y0)));
}