// Small program designed to test my polynomial calculator fpga module
// Before running ensure you define the degree of the polynomial
// as well as the structure of the fixed point representation

#include <stdio.h>
#include <stdint.h>
#include <math.h>

// Polynomial Structure
#define DEGREE 2 // Calculate (a_1*x + a_2)x + a_3

// Fixed point structure
#define FP_SIZE 16
#define FRAC_SIZE 5
#define INT_SIZE 9

#define INT_START_I (FP_SIZE-2) // Save signed bit at index 31
#define INT_END_I (INT_START_I-INT_SIZE)
#define FRAC_START_I (INT_END_I-1)
#define FRAC_END_I (FRAC_START_I-FRAC_SIZE) // This is still confusing

int32_t decimal_to_fp(double decimal);
double fp_to_decimal(int32_t fp);
int32_t mult_add(int32_t x, int32_t a, int32_t b);

int main() {

	// Print the fixed point structure
	printf("Fixed point size:\t%d\tInt size:\t%d\tFraction size:\t%d\n", FP_SIZE, INT_SIZE, FRAC_SIZE);
	printf("Int start index:\t%d\tEnd index:\t%d\n", INT_START_I, INT_END_I);
	printf("Frac start index:\t%d\tEnd index:\t%d\n", FRAC_START_I, FRAC_END_I);

	double test = -11.34;
	int32_t test_fp = decimal_to_fp(test);
	printf("Testing:\t%d", fp_to_decimal(test_fp));


	int32_t coeffients[DEGREE+1];
	int32_t x;
	float temp;

	// Enter and store coeffients and x
	for (int i = 0; i < DEGREE+1; i++) {
		printf("Enter coeffient index %d:\t", i);
		scanf("%d", &temp);
	}
	printf("Enter x:\t");
	scanf("%d", &temp);




	return 0;
}

int32_t mult_add(int32_t x, int32_t a, int32_t b) {

	// Multiply into 64 bit
	int64_t mult = (a*x) + b;

	// Truncate
	int32_t result;

	return result;
}

inline int32_t decimal_to_fp(double decimal) {
	return (int32_t) round(decimal * (1 << FRAC_SIZE));
}

inline double fp_to_decimal(int32_t fp) {
	return ((double) fp / (double) (1<<FRAC_SIZE));
}
