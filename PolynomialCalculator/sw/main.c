// Small program designed to test my polynomial calculator fpga module
// Before running ensure you define the degree of the polynomial
// as well as the structure of the fixed point representation

#include <stdio.h>
#include <stdint.h>
#include <math.h>

// Polynomial Structure
#define DEGREE 2 // Calculate (a_1*x + a_2)x + a_3

// Fixed point structure
#define FP_SIZE 32
#define FRAC_SIZE 21
#define INT_SIZE 10

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
		printf("Coeffient converted to fixed point and back:\t%x\t%f\n", coeffients[i],fp_to_float(coeffients[i]));
	}
	printf("Enter x:\t");
	scanf("%f", &x_sim);
	x = float_to_fp(x_sim);
	printf("x input converted to fixed point and back:\t%x\t%f\n", x,fp_to_float(x));

	// Run through mult_add module
	int32_t result;
	float result_sim;
	for (int i = 0; i < DEGREE; i++){

		if (i == 0) {
			result = mult_add(x, coeffients[i], coeffients[i+1]);
			result_sim = mult_add_sim(x_sim, coeffients_sim[i], coeffients_sim[i+1]);
		}
		else {
			result = mult_add(x, result, coeffients[i+1]);
			result_sim = mult_add_sim(x_sim, result_sim, coeffients_sim[i+1]);
		}

	}

	printf("Expected result:\t%f\n", result_sim);
	printf("Module's result in fixed point and decimal:\t%x\t%f\n", result, fp_to_float(result));

	return 0;
}

int32_t mult_add(int32_t x, int32_t a, int32_t b) {

	// Multiply into 64 bit to accomodate all possible solutions
	int64_t mult = (int64_t) a*x;

	// Truncate to extract only the most significant bits
	int32_t result = (mult>>FRAC_SIZE) & 0xFFFFFFFF;
	result = result + b;
	
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
