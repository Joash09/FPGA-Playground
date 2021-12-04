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

int32_t float_to_fp(float decimal);
float fp_to_float(int32_t fp);
int32_t mult_add(int32_t x, int32_t a, int32_t b);
float mult_add_sim(float x, float a, float b);

int main() {

	float coeffients_sim[DEGREE+1];
	float x_sim;
	int32_t coeffients[DEGREE+1];
	int32_t x;

	// Enter and store coeffients and x
	for (int i = 0; i < DEGREE+1; i++) {
		printf("Enter coeffient index %d:\t", i);
		scanf("%f", &coeffients_sim[i]);
		coeffients[i] = float_to_fp(coeffients_sim[i]);
	}
	printf("Enter x:\t");
	scanf("%f", &x_sim);
	x = float_to_fp(x_sim);

	// Run through mult_add module
	int32_t result;
	float result_sim;
	for (int i = 0; i < DEGREE+1; i++){

		if (i == 0) {
			result = mult_add(x, coeffients[i], coeffients[i+1]);
			result_sim = mult_add_sim(x_sim, coeffients_sim[i], coeffients_sim[i+1]);
		}
		else {
			result = mult_add(x, result, coeffients[i+1]);
			result_sim = mult_add_sim(x, result_sim, coeffients_sim[i+1]);
		}

	}

	printf("Expected result:\t%f\n", result_sim);
	printf("Module's result:\t%d\n", float_to_fp(result));

	return 0;
}

int32_t mult_add(int32_t x, int32_t a, int32_t b) {

	// Multiply into 64 bit to accomodate all possible solutions
	int64_t mult = (a*x) + b;

	// Generate bit masks
	int32_t int_mask = (1<<(INT_SIZE+1)) -1;
	int32_t frac_mask = (1<<FRAC_SIZE) -1;

	// Truncate
	int32_t result;
	result = (mult & int_mask<<(FP_SIZE-INT_SIZE)) | (mult & frac_mask);
	
	return result;
}

float mult_add_sim(float x, float a, float b) {
	return (a*x) + b;
}

// Conversion methods discovered at :
// https://embeddedartistry.com/blog/2018/07/12/simple-fixed-point-conversion-in-c/
int32_t float_to_fp(float decimal) {
	return (int32_t) round(decimal * (1 << FRAC_SIZE));
}

inline float fp_to_float(int32_t fp) {
	return ((float) fp / (float) (1<<FRAC_SIZE));
}
